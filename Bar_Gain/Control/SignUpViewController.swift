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
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        //Add user on firebase database
        FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            if error != nil{
                print(error!)
                self.errorField.isHidden = false
                let errorMessage = error?.localizedDescription
                self.errorField.text = errorMessage
                self.errorField.sizeToFit()
                
            }else{
                print("Successful registration")
                self.performSegue(withIdentifier: "goToHome", sender: self)

            }
        })
        
    }
    
}
