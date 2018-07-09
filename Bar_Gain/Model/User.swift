//
//  User.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 7/2/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import Foundation
import FirebaseAuth

class User{
    
    public private(set) var username: String?
    public private(set) var memberSince: String?
    public private(set) var profileImage: String?
    public private(set) var street: String?
    public private(set) var streetTwo: String?
    public private(set) var city: String?
    public private(set) var state: String?
    
    init(username: String, memberSince: String?, profileImage: String?) {
        self.username = username
        self.memberSince = memberSince
        self.profileImage = profileImage
    }
    
    init(street: String, streetTwo: String, city: String, state: String) {
        self.street = street
        self.streetTwo = streetTwo
        self.city = city
        self.state = state
    }
    
    static func fetchUserData(uid: String, completionBlock: @escaping (_ user: User) -> Void){
        DataService.ds.REF_USERS.document(uid).getDocument { (document, error) in
            if let document = document, document.exists{
                let data = document.data()
                let username = (data!["Username"])! as! String
                let url = (data!["Image Url"])! as! String
                let user = User(username: username, memberSince: nil, profileImage: url)
                completionBlock(user)
            }else{
                print("User document error")
            }
        }
    }
    
    static func fetchShippingInformation(uid: String, completionBlock: @escaping (_ shippingData: Array<String>) -> Void){
        DataService.ds.REF_USERS.document(uid).getDocument { (document, error) in
            if let document = document, document.exists{
                let shipping = document.data()!["Shipping"]
                completionBlock(shipping as! Array<String>)
            }else{
                print("Error fetching shipping information")
            }
        }
    }
    
}
