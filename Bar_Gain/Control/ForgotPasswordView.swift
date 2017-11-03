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
    @IBOutlet weak var messageField: UILabel!
    
    @IBAction func passwordResetButton(_ sender: UIButton) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: emailField.text!) { (error) in
            if error != nil { 
                print(error!)
                self.messageField.isHidden = false 
                let errorMessage = error?.localizedDescription
                self.messageField.text = errorMessage
            }else{
                self.messageField.isHidden = false
                let successMessage = "Succesfully sent email for password reset"
                print(successMessage)
                self.messageField.text = successMessage
            }
        }
    }
    

    
    
    
    
}
