//
//  Profile.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/11/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class Profile: UIViewController {

    @IBOutlet weak var userProfileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImage.layer.cornerRadius = 25
        userProfileImage.clipsToBounds = true
        

        // Do any additional setup after loading the view.
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
