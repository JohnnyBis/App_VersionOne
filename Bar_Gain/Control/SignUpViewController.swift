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
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
  
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        //Add user on firebase database
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            if error != nil{
                print(error!)
                self.errorField.isHidden = false
                let errorMessage = error?.localizedDescription
                self.errorField.text = errorMessage
                self.errorField.sizeToFit()
                
            }else{
                let userData = ["provider": user?.providerID, "Full Name": self.fullNameField.text!, "Email": self.emailField.text!, "Address": self.addressField.text!, "ZIP Code": self.zipCodeField.text!, "State": self.stateField.text!, "Phone Number": self.phoneNumberField.text!]
                
                self.databaseSignin(id: (user?.uid)!, userData: userData as! Dictionary<String, String>)
                print("Successful registration")
                self.performSegue(withIdentifier: "goToHome", sender: self)

            }
        })
        
    }
//
//    func roundProfileImage(){
//
//    }
//
    
    
    func databaseSignin(id: String, userData: Dictionary<String, String>){
        DataService.ds.createFirebaseDBUsers(uid: id, userData: userData)
        
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
