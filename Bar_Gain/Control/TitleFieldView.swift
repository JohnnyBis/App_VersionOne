//
//  ItemFieldView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/16/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class TitleFieldView: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fieldRecognizer(myIndex: myIndex)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        textField.delegate = self
        textField.text = AppDelegate.postData["Item Title"] as? String
        textField.placeholder = placeholder[0]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        AppDelegate.postData["Item Title"] = textField.text
        print(AppDelegate.postData)
    }

    


}
