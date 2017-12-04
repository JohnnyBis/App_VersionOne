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
        textField.text = AppDelegate.postData["Item Title"]
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
    
    
    
//    func fieldRecognizer(myIndex: Int){
//        if myIndex == 0{
//            textField.placeholder = placeholder[myIndex]
//            textField.text = AppDelegate.postData["Item Title"]
//
//        }else if myIndex == 1{
//            textField.placeholder = placeholder[myIndex]
////            fieldHeader.sizeToFit()
//            textField.text = AppDelegate.postData["Conditions"]
//
//        }else if myIndex == 2{
//            textField.placeholder = placeholder[myIndex]
////            fieldHeader.center = CGPoint(x: w / 2, y: 48)
//            textField.text = AppDelegate.postData["Shipping Method"]
//
//
//        }else{
//            textField.placeholder = placeholder[myIndex]
//            textField.text = AppDelegate.postData["Description"]
//
//        }
//    }
//
    
    
//    @IBAction func backButtonPressed(_ sender: UIButton) {
//        appendDataToDictionary(myIndex: myIndex)
//        performSegue(withIdentifier: "goToAddItemView", sender: self)
//    }
//
//    func appendDataToDictionary(myIndex: Int){
//        if myIndex == 0{
//            AppDelegate.postData["Item Title"] = textField.text!
//            print(AppDelegate.postData)
//
//        }else if myIndex == 1{
//            AppDelegate.postData["Conditions"] = textField.text!
//            print(AppDelegate.postData)
//
//        }else if myIndex == 2{
//            AppDelegate.postData["Shipping Method"] = textField.text!
//            print(AppDelegate.postData)
//
//        }else{
//            AppDelegate.postData["Description"] = textField.text!
//            print(AppDelegate.postData)
//        }
//    }
    


}
