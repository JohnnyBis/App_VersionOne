//
//  MessageView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/12/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import Firebase

class ChatMessageView: UIViewController, UITextFieldDelegate{
   
    
    var messageArray : [Message] = [Message]()

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    @IBOutlet weak var receiverProfileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextfield.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    
    //MARK: - textFieldDidBeginEditing func
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5){
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
        
    }
    
    //MARK: - textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
        
    }

}
