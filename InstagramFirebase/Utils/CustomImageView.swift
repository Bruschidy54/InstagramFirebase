//
//  CustomImageView.swift
//  InstagramFirebase
//
//  Created by Dylan Bruschi on 3/13/18.
//  Copyright © 2018 Dylan Bruschi. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    var lastURLUsedToLoadImage: String?
    
    func loadImage(urlString: String) {
        
        lastURLUsedToLoadImage = urlString
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch post image:", err)
                return
            }
            
            if url.absoluteString != self.lastURLUsedToLoadImage {
                return
            }
            
            // TO DO: check for HTTP response status of 200 meaning OK
            
            guard let imageData = data else { return }
            
            let photoImage = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                
                self.image = photoImage
            }
            }.resume()
    }
}
