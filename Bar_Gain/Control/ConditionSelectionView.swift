//
//  ConditionSelectionView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/19/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class ConditionSelectionView: UIViewController {
    
    @IBOutlet weak var containmentBox: UIView!
    @IBOutlet weak var fairConditionsButton: UIButton!
    @IBOutlet weak var goodConditionsButton: UIButton!
    @IBOutlet weak var perfectConditionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cornerRadius = 10.0
        fairConditionsButton.layer.cornerRadius = CGFloat(cornerRadius)
        goodConditionsButton.layer.cornerRadius = CGFloat(cornerRadius)
        perfectConditionsButton.layer.cornerRadius = CGFloat(cornerRadius)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fairConditionsButtonPressed(_ sender: UIButton) {
        setConditionsToPostDB(Conditions: "Fair")
        fairConditionsButton.isEnabled = false
    }
    
    @IBAction func learnMoreButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            
            let containerFrame = CGRect(x: self.containmentBox.frame.minX, y: self.containmentBox.frame.minY, width: self.containmentBox.frame.width, height: self.containmentBox.frame.height + 300)
            self.containmentBox.frame = containerFrame
        }
        
    }
    
    
    func setConditionsToPostDB(Conditions: String){
        AppDelegate.postData["Conditions"] = Conditions
        print(AppDelegate.postData)
    }
    



}
