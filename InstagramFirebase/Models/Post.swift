//
//  Post.swift
//  InstagramFirebase
//
//  Created by Dylan Bruschi on 3/12/18.
//  Copyright © 2018 Dylan Bruschi. All rights reserved.
//

import Foundation

struct Post {
    let imageUrl: String
    
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}
