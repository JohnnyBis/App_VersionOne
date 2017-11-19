//
//  SignUpViewTwo.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/14/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class SignUpViewTwo: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorField: UILabel!
    @IBOutlet weak var errorBox: UIView!
    @IBOutlet weak var emailBox: UIView!
    @IBOutlet weak var passwordBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Error feature is hidden
        errorBox.isHidden = true
        errorField.isHidden = true
        //All boxes are rounded
        errorBox.layer.cornerRadius = 10.0
        passwordBox.layer.cornerRadius = 10.0
        emailBox.layer.cornerRadius = 10.0
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: { (user, error) in
            if error != nil{
                print(error!)
                self.errorField.isHidden = false
                self.errorBox.isHidden = false
                
                let errorMessage = error?.localizedDescription
                self.errorField.text = errorMessage
                self.errorField.sizeToFit()
                
            }else{
                AppDelegate.userData["Email"] = self.email.text!
                self.creatDBUser(id: (user?.uid)!, userData: AppDelegate.userData)
                print("Successful registration")
                self.performSegue(withIdentifier: "goToThirdSignUp", sender: self)
                
            }
        })
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func creatDBUser(id: String, userData: Dictionary<String, String>){
        DataService.ds.createFirebaseDBUsers(uid: id, userData: userData)
        
    }
    
    
    
    
}
