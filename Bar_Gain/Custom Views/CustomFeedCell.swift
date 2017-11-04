//
//  CustomFeedCell.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/2/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class CustomFeedCell: UITableViewCell {
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var imageBox: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundImage()
        imageBox.layer.cornerRadius = 5;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func commonInit(_ itemName: String, userName: String, description: String, imageName: String, profileImage: String){
        userLabel.text = userName
        itemImage.image = UIImage(named: imageName)
        itemLabel.text = itemName
        descriptionLabel.text = description
        userImage.image = UIImage(named:  profileImage)
    }
    
    func roundImage(){
        userImage.layer.borderColor = UIColor.black.cgColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
        userImage.contentMode = .scaleAspectFill
    }
    

}
