//
//  ViewController.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/8/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    //Variables:
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultMenu: UITableView!
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Text Field set as Delegate
        textField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Text Field moves upword when user beings editing.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1){
            let logoframe = CGRect(x: self.imageLogo.frame.minX, y: -self.imageLogo.frame.height , width: self.imageLogo.frame.width, height: self.imageLogo.frame.height)
            self.imageLogo.frame = logoframe
            let fieldframe = CGRect(x: textField.frame.minX, y: 2*UIApplication.shared.statusBarFrame.height, width: textField.frame.width, height: textField.frame.height)
            self.textField.frame = fieldframe
            self.view.layoutIfNeeded()
            
        }
//        UIView.animate(withDuration: 1, delay: 1, animations: {
//            let resultFrame = CGRect(x: self.resultMenu.frame.minX, y: 121, width: self.resultMenu.frame.width, height: 570)
//            self.resultMenu.isHidden = false
//            self.resultMenu.frame = resultFrame
//        })
    }
    
    
    //Text field ------- once user stops editing.
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        }

}
