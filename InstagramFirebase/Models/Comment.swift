//
//  Comment.swift
//  InstagramFirebase
//
//  Created by Dylan Bruschi on 3/15/18.
//  Copyright © 2018 Dylan Bruschi. All rights reserved.
//

import Foundation

struct Comment {
    let text: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["text"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
