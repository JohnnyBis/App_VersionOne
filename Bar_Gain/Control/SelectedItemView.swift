//
//  SelectedItemView.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 1/11/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import UIKit

class SelectedItemView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.text = postList[itemIndex].itemTitle
        itemTitle.sizeToFit()
        if let imageUrl = postList[itemIndex].imageUrl{
            let url = URL(string: imageUrl)
            itemImage.kf.setImage(with: url)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
