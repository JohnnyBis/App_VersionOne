//
//  ConditionSelectionView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/19/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class ConditionSelectionView: UIViewController {
    
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var containmentBox: UIView!
    @IBOutlet weak var fairConditionsButton: UIButton!
    @IBOutlet weak var goodConditionsButton: UIButton!
    @IBOutlet weak var perfectConditionsButton: UIButton!
    @IBOutlet weak var boxLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cornerRadius = 10.0
        fairConditionsButton.layer.cornerRadius = CGFloat(cornerRadius)
        goodConditionsButton.layer.cornerRadius = CGFloat(cornerRadius)
        perfectConditionsButton.layer.cornerRadius = CGFloat(cornerRadius)
        boxLine.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func fairConditionsButtonPressed(_ sender: UIButton) {
        setConditionsToPostDB(Conditions: "Fair")
        fairConditionsButton.isEnabled = false
        goodConditionsButton.isEnabled = true
        perfectConditionsButton.isEnabled = true
    }
    
    @IBAction func goodButtonPressed(_ sender: UIButton) {
        setConditionsToPostDB(Conditions: "Good")
        goodConditionsButton.isEnabled = false
        fairConditionsButton.isEnabled = true
        perfectConditionsButton.isEnabled = true
    }
    
    @IBAction func perfectButtonPressed(_ sender: UIButton) {
        setConditionsToPostDB(Conditions: "Perfect")
        goodConditionsButton.isEnabled = true
        fairConditionsButton.isEnabled = true
        perfectConditionsButton.isEnabled = false
        
    }
    
    @IBAction func learnMoreButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            
            if self.learnMoreButton.currentTitle == "Learn More"{
                let containerFrame = CGRect(x: self.containmentBox.frame.minX, y: self.containmentBox.frame.minY, width: self.containmentBox.frame.width, height: self.containmentBox.frame.height + 300)
                self.containmentBox.frame = containerFrame
                self.learnMoreButton.setTitle("Hide", for: .normal)
                self.boxLine.isHidden = false
            }else{
                self.learnMoreButton.setTitle("Learn More", for: .normal)
                let containerFrame = CGRect(x: self.containmentBox.frame.minX, y: self.containmentBox.frame.minY, width: self.containmentBox.frame.width, height: self.containmentBox.frame.height - 300)
                 self.containmentBox.frame = containerFrame
                self.boxLine.isHidden = true
                
            }
        }
        
    }
    
    
    func setConditionsToPostDB(Conditions: String){
        AppDelegate.postData["Conditions"] = Conditions
        print(AppDelegate.postData)
    }
    



}
