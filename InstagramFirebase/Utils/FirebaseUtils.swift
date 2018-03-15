//
//  FirebaseUtils.swift
//  InstagramFirebase
//
//  Created by Dylan Bruschi on 3/14/18.
//  Copyright © 2018 Dylan Bruschi. All rights reserved.
//

import Foundation
import Firebase

extension FIRDatabase {
    static func fetchUserWithUID(uid: String, completion: @escaping (User) -> ()) {
        FIRDatabase.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            
            let user = User(uid: uid, dictionary: userDictionary)
            
            completion(user)
            
        }) { (err) in
            print("Failed to fetch user for posts:", err)
        }
        
    }
}
