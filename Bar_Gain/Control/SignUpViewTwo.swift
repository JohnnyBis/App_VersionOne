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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        AppDelegate.userData["Email"] = email.text!
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: { (user, error) in
            if error != nil{
                print(error!)
                self.errorField.isHidden = false
                let errorMessage = error?.localizedDescription
                self.errorField.text = errorMessage
                self.errorField.sizeToFit()
                
            }else{
                self.databaseSignin(id: (user?.uid)!, userData: AppDelegate.userData)
                print("Successful registration")
                self.performSegue(withIdentifier: "goToThirdSignUp", sender: self)
                
            }
        })
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func databaseSignin(id: String, userData: Dictionary<String, String>){
        DataService.ds.createFirebaseDBUsers(uid: id, userData: userData)
        
    }
    
    
    
    
}
