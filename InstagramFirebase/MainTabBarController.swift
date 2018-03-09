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
        
        setupViewControllers()
        
    }
    
    func setupViewControllers() {
        
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "unselectedHome"), selectedImage: #imageLiteral(resourceName: "selectedHome"), rootViewController: UserProfileController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let searchNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "unselectedSearch"), selectedImage: #imageLiteral(resourceName: "selectedSearch"))
        
        let plusNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "unselectedPlus"), selectedImage: #imageLiteral(resourceName: "unselectedPlus"))
        
        let likeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "unselectedHeart"), selectedImage: #imageLiteral(resourceName: "selectedHeart"))
        
        // user profile
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        
        let userProfileNavController = UINavigationController(rootViewController: userProfileController)
        userProfileNavController.tabBarItem.image = #imageLiteral(resourceName: "unselectedProfileIcon")
        userProfileNavController.tabBarItem.selectedImage = #imageLiteral(resourceName: "selectedProfileIcon")
        
        tabBar.tintColor = .black
        viewControllers = [homeNavController, searchNavController, plusNavController, likeNavController, userProfileNavController]
        
        // modify tab bar item insets
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
