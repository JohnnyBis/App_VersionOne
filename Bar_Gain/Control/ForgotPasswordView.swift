//
//  ForgotPasswordView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 10/7/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordView:UIViewController{
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var boxField: UIView!
    @IBOutlet weak var resetButton: UIView!
    
    @IBAction func passwordResetButton(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: emailField.text!) { (error) in
            if error != nil { 
                print(error!)
                self.emailField.layer.borderColor = UIColor.red.cgColor
                self.emailField.layer.borderWidth = 0.5
             
            }else{
                let successMessage = "Succesfully sent email for password reset"
                print(successMessage)
                self.performSegue(withIdentifier: "goToLoginFromReset", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        self.boxField.layer.cornerRadius = 10.0
        self.resetButton.layer.cornerRadius = 10.0
        self.emailField.layer.borderWidth = 1.0
        self.emailField.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    

    
    
    
    
}
