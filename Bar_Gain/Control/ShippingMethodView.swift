//
//  ShippingMethodView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/3/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class ShippingMethodView: UIViewController {

    @IBOutlet weak var upsButton: UIButton!
    @IBOutlet weak var carrierBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func upsButtonPressed(_ sender: UIButton) {
        animateCarrierBox()
    }
    
    
    
    func animateCarrierBox(){
        let expandedHeight = self.carrierBox.frame.height + 80
        UIView.animate(withDuration: 0.75) {
            let expandedFrame = CGRect(x: self.carrierBox.frame.minX, y: self.carrierBox.frame.minY, width: self.carrierBox.frame.width, height: expandedHeight)
            self.carrierBox.frame = expandedFrame
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
