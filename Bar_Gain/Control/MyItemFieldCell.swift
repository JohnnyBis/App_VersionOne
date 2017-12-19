//
//  MyItemFieldCell.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 12/10/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class MyItemFieldCell: UITableViewCell {
    @IBOutlet weak var fieldTitle: UILabel!
    @IBOutlet weak var fieldInput: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
