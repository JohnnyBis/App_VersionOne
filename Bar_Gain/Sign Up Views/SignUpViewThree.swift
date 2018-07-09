//
//  SignUpViewThree.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/14/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignUpViewThree: UIViewController {
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var state: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        if checkforSubscription() == false{
            print("Error with subscription fields.")
        }else{
            performSegue(withIdentifier: "goToHomeFromSignUp", sender: self)
        }
    }
    
    func checkforSubscription() -> Bool{
        if(self.address.text?.isEmpty ?? true || self.zipCode.text?.isEmpty ?? true || self.zipCode.text?.isEmpty ?? true){
            print("Field(s) not completed")
            return false
        }else{
            AppDelegate.userData["Subscription"] = "False"
            let userid = Auth.auth().currentUser?.uid
            appendUserDBInfo(id: userid!, userData: AppDelegate.userData)
            return true
        }
    }
    
    func appendUserDBInfo(id: String, userData: Dictionary<String, String>){
        DataService.ds.createFirebaseDBUsers(uid: id, userData: userData)
    }
        

}
