//
//  MainTabBarController.swift
//  Podcast
//
//  Created by Ahmet Acar on 17.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import Foundation
import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple
        
        setupViewControllers()
        
        
    }
    
    //MARK: Setup Functions
    func setupViewControllers() {
        
        viewControllers = [
            generateNavigationController(with: PodcastsSearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(with: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(with: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "downloads"))
        ]
    }
    
    //MARK: Helper Functions
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        //rootViewController.navigationItem.largeTitleDisplayMode = .always  -- not worked
        //navController.navigationBar.prefersLargeTitles = true -- move to inside of the viewDidLoad
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
    
    
}
