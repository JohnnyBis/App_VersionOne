//
//  ItemDescriptionView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/19/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class ItemDescriptionView: UIViewController, UITextViewDelegate{

    @IBOutlet weak var descriptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor: UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        descriptionField.layer.borderWidth = 0.5
        descriptionField.layer.borderColor = borderColor.cgColor
        descriptionField.layer.cornerRadius = 10.0
        descriptionField.delegate = self
        descriptionField.text = AppDelegate.postData["Description"] as? String

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        AppDelegate.postData["Description"] = descriptionField.text
        print(AppDelegate.postData)
    }
    
    
    

}
