//
//  PostAnItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/1/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class PostAnItemView: UIViewController {

    @IBOutlet weak var postNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postNowButton.layer.cornerRadius = 10.0
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
