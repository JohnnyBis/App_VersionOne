//
//  ShippingCartViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 7/7/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import UIKit

class ShippingCartViewController: UIViewController {

    @IBOutlet weak var selectedItem: UILabel!
    @IBOutlet weak var box: UIView!
    @IBOutlet weak var boxTwo: UIView!
    @IBOutlet weak var statusMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedItem.text = "You are renting: \(post.itemTitle!)"
//        selectedItem.textColor = UIColor(red:0.91, green:0.64, blue:0.09, alpha:1.0)

        statusMessage.isHidden = true

        User.fetchShippingInformation(uid: Global.variables.uid) { (array) in
            if array == []{
                print(array)
            }else{
                self.statusMessage.isHidden = false
                self.statusMessage.text = "No current shipping information."
            }
        }
        boxStyle(view: box)
        boxStyle(view: boxTwo)
        navigationItem.title = "Shipping Address"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func boxStyle(view: UIView){
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
    func shipping(){
//        User.fetchShippingInformation(uid: Global.variables.uid) { (user) in
//            if user != nil{
//                shippingInformation.textColor = "Street 1: \(user?.street) \n Street 2: \(user?.streetTwo) \n City: \(user?.city) \n State: \(user?.state)"
//            }else{
//                print("No shipping information stored.")
//            }
//        }
    }


}
