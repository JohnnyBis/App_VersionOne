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
    @IBOutlet weak var ViewBox: UIView!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func pressedForgotButton(_ sender: UITextField) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: emailField, completion: { (user, error) in
            <#code#>
        })
    }
    
    
    
    
}
