//
//  AddItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 10/4/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class AddItemView: UIViewController, UITextViewDelegate {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var conditionsTextField: UITextField!
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var numberCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        numberCount.text = "\(changedText.count - 1)"
        
        return changedText.count <= 250
    }
    
    
}
