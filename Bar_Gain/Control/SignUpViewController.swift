//
//  SignUpViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/15/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    //Variables:
    @IBOutlet weak var errorField: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var fieldBox: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldBox.layer.cornerRadius = 10.0
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        AppDelegate.userData["First Name"] = firstName.text!
        AppDelegate.userData["Last Name"] = lastName.text!
        performSegue(withIdentifier: "goToSecondSignUp", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
  
    }
    
    
//    func fieldCheck(){
//        if(self.fullNameField.text?.isEmpty ?? true){
//            fullNameField.layer.borderColor = UIColor.red
//        }
//
//        else if(self.passwordField.text?.isEmpty ?? true){
//            fullNameField.layer.borderColor = UIColor.red
//
//        }
//        else if(emailField.text?.isEmpty ?? true){
//
//
//        }
//        else if(self.addressField.text?.isEmpty ?? true){
//
//
//        }
//        else if(self.zipCodeField.text?.isEmpty ?? true){
//
//        }
//
//        else if(self.phoneNumberField.text?.isEmpty ?? true){
//
//        }
//    }
    
        
    
}
