//
//  CityViewController.swift
//  WeatherApp
//
//  Created by ping tseng tsai on 2018-05-24.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class CityViewController: UITabBarController {
    
    var detailController = UINavigationController(rootViewController: DetailViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        setupTabBar()
    }
    
    func setupTabBar() {
        let vancouverViewController = UINavigationController(rootViewController: VancouverViewController())
        vancouverViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "one")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "one_selected"))
        
        let taipeiViewController = UINavigationController(rootViewController: TaipeiViewController())
        taipeiViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "two")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "two_selected"))
        
        let tokyoViewController = UINavigationController(rootViewController: TokyoViewController())
        tokyoViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "three")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "three_selected"))
        
        let seoulViewController = UINavigationController(rootViewController: SeoulViewController())
        seoulViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "four")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "four_selected"))
        
        let surreyViewController = UINavigationController(rootViewController: SurreyViewController())
        surreyViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "five")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "five_selected"))
        
        viewControllers = [vancouverViewController, taipeiViewController, tokyoViewController, seoulViewController, surreyViewController]
        
        let items = tabBar.items
        for item in items! {
            item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
        
    }

}

