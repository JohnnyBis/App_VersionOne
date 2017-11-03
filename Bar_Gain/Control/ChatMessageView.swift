//
//  MessageView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/12/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit
import Firebase

class ChatMessageView: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
    
    
    //Instance Variable - messageArray for Message class
    var messageArray : [Message] = [Message]()
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    @IBOutlet weak var receiverProfileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegate for TextView
        messageTextfield.delegate = self
        
        //Delagte for TableView
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        //Tap Gesture Configuration
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        //Call configure tableview function
        configureTableView()
        
        
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill

        
        
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
        textFieldAnimationBegin()
        
    }
    
    func textFieldAnimationBegin(){
        UIView.animate(withDuration: 0.75) {
            let textFrame = CGRect(x: self.messageTextfield.frame.minX, y: self.messageTextfield.frame.minY, width: self.messageTextfield.frame.width + 20, height: self.messageTextfield.frame.height)
            self.messageTextfield.frame = textFrame
        }
        
        UIView.animate(withDuration: 0.75) {
            let buttonFrame = CGRect(x: self.sendButton.frame.minX + 20, y: self.sendButton.frame.minY, width: self.sendButton.frame.width, height: self.sendButton.frame.height)
            self.sendButton.frame = buttonFrame
            
        }
        
    }
    
    func textFieldAnimationEnd(){
        UIView.animate(withDuration: 0.75) {
            let textFrame = CGRect(x: self.messageTextfield.frame.minX, y: self.messageTextfield.frame.minY, width: self.messageTextfield.frame.width - 20, height: self.messageTextfield.frame.height)
            self.messageTextfield.frame = textFrame
        }
        
        UIView.animate(withDuration: 0.75) {
            let buttonFrame = CGRect(x: self.sendButton.frame.minX - 20, y: self.sendButton.frame.minY, width: self.sendButton.frame.width, height: self.sendButton.frame.height)
            self.sendButton.frame = buttonFrame
        }
    }
    
    //MARK: - textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
        
        textFieldAnimationEnd()
        
    }
    
    //MARK: - TableView configuration set of functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageTableView.dequeueReusableCell(withIdentifier: K.cells.messageCell, for: indexPath) as! MessageCell
        
        cell.messageText.text = messageArray[indexPath.row].messageBody
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
        
    }
    
    func configureTableView() {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
        
    }
    
    //MARK: - tableViewTapped func configured
    @objc func tableViewTapped(){
        messageTextfield.endEditing(true)
    }
    

}
