//
//  MainTabBarController.swift
//  
//
//  Created by Dylan Bruschi on 3/6/18.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: userProfileController)
        navController.tabBarItem.image = #imageLiteral(resourceName: "unselectedProfileIcon")
        navController.tabBarItem.selectedImage = #imageLiteral(resourceName: "selectedProfileIcon")
        
        tabBar.tintColor = .black
        viewControllers = [navController]
    }
}
