//
//  SelectedItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 1/11/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import BraintreeDropIn
import Braintree

var post = postList[itemIndex]

class SelectedItemView: UIViewController {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemCondition: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var itemOwner: UIButton!
    @IBOutlet weak var rentNowButton: UIButton!
    
    let dailyDate = NSDate()
    let token = "sandbox_f3zwdrft_sd9pjw2cnrb6s9gp"
    let amount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        itemTitle.text = post.itemTitle
        itemTitle.sizeToFit()
        if let imageUrl = post.imageUrl{
            let url = URL(string: imageUrl)
            itemImage.kf.setImage(with: url)
            
        }
        itemCondition.text = post.condition
        itemDescription.text = post.caption
        itemDescription.sizeToFit()
        DailyViewsTimer()
        price.sizeToFit()
        viewCounter()
        User.fetchUserData(uid: Global.variables.uid) { (user) in
            self.itemOwner.setTitle(user.username, for: .normal)
        }
        rentNowButton.backgroundColor = UIColor(red:0.91, green:0.64, blue:0.09, alpha:1.0)
        rentNowButton.layer.cornerRadius = 5
        navigationItem.title = "Item"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showDropIn(clientTokenOrTokenizationKey: String) {
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: token, request: request)
        { [unowned self] (controller, result, error) in
            
            if let error = error {
                print(error.localizedDescription)
                
            } else if (result?.isCancelled == true) {
                print("Transaction Cancelled")
                
            } else if let nonce = result?.paymentMethod?.nonce, let amount = self.amountTextField.text {
                self.sendRequestPaymentToServer(nonce: nonce, amount: amount)
            }
            controller.dismiss(animated: true, completion: nil)
        }
        self.present(dropIn!, animated: true, completion: nil)

    }
    
    func sendRequestPaymentToServer(nonce: String, amount: String) {
        let paymentURL = URL(string:"http://192.168.64.2/Donate/pay.php")!
        var request = URLRequest(url: paymentURL)
        request.httpBody = "payment_method_nonce=\(nonce)&amount=\(amount)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) {(data, response, error) -> Void in
            guard let data = data else {
                print(error!.localizedDescription)
                return
            }
            
            guard let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let success = result?["success"] as? Bool, success == true else {
                print("Transaction failed. Please try again.")
                return
            }
            
            print("Successfully charged $\(amount)")
            }.resume()
    }
    
    func DailyViewsTimer(){
        let currentDate = NSDate()
        let newDate = NSDate(timeInterval: 86400, since: currentDate as Date)
        UserDefaults.standard.setValue(newDate, forKey: "waitingDate")
        if let waitingDate:NSDate = UserDefaults.standard.value(forKey: "waitingDate") as? NSDate {
            if (dailyDate.compare(waitingDate as Date) == ComparisonResult.orderedDescending) {
                print("Reset views")
            }
            else {
                if let views = post.views {
                    price.text = "Time post was seen \(views) times today."
                }else{
                    price.isHidden = true
                    return
                    
                }
            }
        }
    }
    
    func viewCounter(){
        if Auth.auth().currentUser != nil {
            return
        }else{
            DataService().REF_POSTS.document(post.documentID!).updateData(["Views" : post.views! + 1]) { (error) in
                if error != nil{
                    print("Error")
                }else{
                    print("Successfully added one view")
                }
            }
        }
        
    }
    
    @IBAction func rentNowButtonPressed(_ sender: UIButton) {
        showDropIn(clientTokenOrTokenizationKey: token)
    }
    

        
    
    


}
