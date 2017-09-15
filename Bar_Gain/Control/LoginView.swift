//
//  LoginView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/15/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginView: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            if error != nil{
                print(error!)
            }else{
                print("Succesfully signed in")
            }
        })
        
        performSegue(withIdentifier: "goToHomefromLogin", sender: self)
        
    }
    


}
