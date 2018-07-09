//
//  WelcomeViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 6/29/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var RegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginButton.backgroundColor = .clear
        LoginButton.layer.cornerRadius = 20
        LoginButton.layer.borderWidth = 1
        LoginButton.layer.borderColor = UIColor.white.cgColor
        
        RegisterButton.backgroundColor = .clear
        RegisterButton.layer.cornerRadius = 20
        RegisterButton.layer.borderWidth = 1
        RegisterButton.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
