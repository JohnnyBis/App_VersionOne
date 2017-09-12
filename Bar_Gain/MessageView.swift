//
//  MessageView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/12/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class MessageView: UIViewController {

    @IBOutlet weak var receiverProfileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        receiverProfileImage.layer.borderWidth = 1
        receiverProfileImage.layer.masksToBounds = false
        receiverProfileImage.layer.cornerRadius = receiverProfileImage.frame.height/2
        receiverProfileImage.clipsToBounds = true
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
