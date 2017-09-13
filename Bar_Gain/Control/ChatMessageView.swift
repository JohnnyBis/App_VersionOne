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
        
        configureTableView()
        
        
        

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
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

}
