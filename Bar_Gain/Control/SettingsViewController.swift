//
//  SettingsViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/16/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "goToSignIn", sender: self)
        }
        catch {
            print("error: there was a problem signing out")
        }
        
 
        
    }
    

}
