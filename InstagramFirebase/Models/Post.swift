//
//  Post.swift
//  InstagramFirebase
//
//  Created by Dylan Bruschi on 3/12/18.
//  Copyright © 2018 Dylan Bruschi. All rights reserved.
//

import Foundation

struct Post {
    let user: User
    let imageUrl: String
    let caption: String
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
    }
}
