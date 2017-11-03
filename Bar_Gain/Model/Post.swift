//
//  Post.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/3/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import Foundation

class Post {
//     var imageUrl: String
//     var userName: String


    var caption: String?
    var itemTitle: String?
    
    
    init(description: String?, itemName: String?) {
//        self.imageUrl = image
//        self.userName = user
        self.caption = description
        self.itemTitle = itemName
    }

}
