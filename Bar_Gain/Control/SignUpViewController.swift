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
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var fieldBox: UIView!
    @IBOutlet weak var errorBox: UIView!
    @IBOutlet weak var errorLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldBox.layer.cornerRadius = 10.0
        errorBox.isHidden = true
        errorBox.layer.cornerRadius = 10.0
        errorLabel.isHidden = true        
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {

        if firstName.text?.isEmpty ?? true{
            errorBox.isHidden = false
            errorLabel.isHidden = false
            errorLabel.text = "Please insert your first name."
            
        }else if lastName.text?.isEmpty ?? true {
            errorBox.isHidden = false
            errorLabel.isHidden = false
            errorLabel.text = "Please insert your last name."
        
            
        }else if lastName.text?.isEmpty ?? true && firstName.text?.isEmpty ?? true{
            errorBox.isHidden = false
            errorLabel.isHidden = false
            errorLabel.text = "Please fill in both fields."
         
        }else{
            AppDelegate.userData["First Name"] = firstName.text!
            AppDelegate.userData["Last Name"] = lastName.text!
            performSegue(withIdentifier: "goToSecondSignUp", sender: self)
            
        }
 
    }
    
//    func errorAnimation(){
//        if lastName.text?.isEmpty ?? true || firstName.text?.isEmpty ?? true{
//            UIView.animate(withDuration: 0.1) {
//                let fieldFrame = CGRect(x: self.fieldBox.frame.minX, y: self.fieldBox.frame.minY, width: self.fieldBox.frame.width, height: 127)
//                self.fieldBox.frame = fieldFrame
//                self.fieldBox.isHidden = false
//
//            }
//        }
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
  
    }
    
    
        
    
}
