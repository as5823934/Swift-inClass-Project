//
//  AppDelegate.swift
//  Assignment 5
//
//  Created by ping tseng tsai on 2018-05-30.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        
        let vancouver = City(name: "Vancouver", temperature: 20, weatherimage: UIImage(named: "sun")!, summary: "Sunny")
        let newYork = City(name: "New York", temperature: 22, weatherimage: UIImage(named:"sun")!,summary: "Sunny")
        let tokyo = City(name: "Tokyo", temperature: 30, weatherimage: UIImage(named:"sun")!,summary: "Hot")
        let london = City(name: "London", temperature: 19, weatherimage: UIImage(named:"cloudy")!,summary: "Cloudy")
        let hongKong = City(name: "Hong Kong", temperature: 35, weatherimage: UIImage(named:"cloudy")!,summary: "Sticky")
        
        let vanVC = CityViewController()
        vanVC.cityInfo = vancouver
        vanVC.title = vancouver.name
        vanVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "one")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "one_selected"))
        
        let nyVC = CityViewController()
        nyVC.cityInfo = newYork
        nyVC.title = newYork.name
        nyVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "two")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "two_selected"))
        
        let tkVC = CityViewController()
        tkVC.cityInfo = tokyo
        tkVC.title = tokyo.name
        tkVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "three")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "three_selected"))
        
        let ldVC = CityViewController()
        ldVC.cityInfo = london
        ldVC.title = london.name
        ldVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "four")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "four_selected"))
        
        let hkVC = CityViewController()
        hkVC.cityInfo = hongKong
        hkVC.title = hongKong.name
        hkVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "five")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "five_selected"))
        
        let baseControllers = [vanVC, nyVC, tkVC, ldVC, hkVC]
        
        tabBarController.viewControllers = baseControllers.map { UINavigationController(rootViewController: $0) }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }


}

