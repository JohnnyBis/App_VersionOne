//
//  ItemFieldView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/16/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class ItemFieldView: UIViewController {
    
    @IBOutlet weak var fieldHeader: UILabel!
    @IBOutlet weak var textField: UITextField!
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldRecognizer(myIndex: myIndex)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fieldRecognizer(myIndex: Int){
        if myIndex == 0{
            textField.placeholder = placeholder[myIndex]
            fieldHeader.text = addItemFields[myIndex]
            fieldHeader.sizeToFit()
        }else if myIndex == 1{
            textField.placeholder = placeholder[myIndex]
            fieldHeader.text = addItemFields[myIndex]
            fieldHeader.sizeToFit()
        
        }else if myIndex == 2{
            textField.placeholder = placeholder[myIndex]
            fieldHeader.text = addItemFields[myIndex]
            fieldHeader.sizeToFit()
            fieldHeader.center = CGPoint(x: w / 2, y: 48)


        }else{
            textField.placeholder = placeholder[myIndex]
            fieldHeader.text = addItemFields[myIndex]
            fieldHeader.sizeToFit()
            
        }
    }
    



}
