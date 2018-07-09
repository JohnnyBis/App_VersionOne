//
//  Globals.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 7/2/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import Foundation
import FirebaseAuth

class Global{
    let uid = (Auth.auth().currentUser?.uid)!
    static let variables = Global()
}
