//
//  Post.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/3/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class Post {
     var imageUrl: String?
//     var userName: String
    var caption: String?
    var itemTitle: String?
    var condition: String?
    var views: Int?
    var documentID: String?
//    var price: String
    
    
    init(description: String?, itemName: String?, url: String?, condition: String?, views: Int?, documentID: String?) {
        self.imageUrl = url
//        self.userName = user
        self.caption = description
        self.itemTitle = itemName
        self.condition = condition
        self.views = views
        self.documentID = documentID
        
    }
    
    static func fetchData(_ posts: [Post] , completionBlock: @escaping (_ post: Post?, _ error: String?) -> Void){
        if Auth.auth().currentUser != nil{
            DataService.ds.REF_POSTS.addSnapshotListener { (querySnapshot, error) in
                guard let postChanges = querySnapshot else{
                    print("Error fetching document: \(error!)")
                    return
                }
                postChanges.documentChanges.forEach({ (diff) in
                    if diff.type == .added || diff.type == .modified || diff.type == .removed{
                        let documentID = diff.document.documentID
                        let description = diff.document.data()["Description"] as? String
                        let title = diff.document.data()["Item Title"] as? String
                        let condition = diff.document.data()["Conditions"] as? String
                        let views = diff.document.data()["Views"] as? Int
                        if let url = diff.document.data()["Image Url"] as? String {
                            let post = Post(description: description, itemName: title, url: url, condition: condition, views: views, documentID: documentID)
                            completionBlock(post, nil)
                        }
                    }
                })
            }
        }else{
            print("Data fecth error: user could not be authenitcated.")
        }
        
    }
    
    
    static func fetchSavedItems(_ posts: [Post], completionBlock: @escaping (_ post: Post?, _ error: String?) -> Void){
        DataService.ds.REF_POSTS.addSnapshotListener { (querySnapshot, error) in
            guard let postChanges = querySnapshot else{
                print("Error fetching document: \(error!)")
                return
            }
            postChanges.documentChanges.forEach({ (diff) in
                if diff.type == .added || diff.type == .modified || diff.type == .removed{
                    let description = diff.document.data()["Description"] as? String
                    let title = diff.document.data()["Item Title"] as? String
                    let condition = diff.document.data()["Condition"] as? String
                    if let url = diff.document.data()["Image Url"] as? String{
                        let savedPost = Post(description: description, itemName: title, url: url, condition: condition, views: nil, documentID: nil)
                        completionBlock(savedPost, nil)
                    }
                }
            })
        }
    }
    
}
