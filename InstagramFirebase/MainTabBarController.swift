//
//  MainTabBarController.swift
//  
//
//  Created by Dylan Bruschi on 3/6/18.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FIRAuth.auth()?.currentUser == nil {
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            return
        }
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: userProfileController)
        navController.tabBarItem.image = #imageLiteral(resourceName: "unselectedProfileIcon")
        navController.tabBarItem.selectedImage = #imageLiteral(resourceName: "selectedProfileIcon")
        
        tabBar.tintColor = .black
        viewControllers = [navController]
    }
}