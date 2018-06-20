//
//  AppDelegate.swift
//  TableViewControllerDemo
//
//  Created by ping tseng tsai on 2018-05-25.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let splitVC = window?.rootViewController as! UISplitViewController
        splitVC.delegate = self
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            splitVC.preferredDisplayMode = .primaryOverlay
            //.AllVisible
            //.primaryHidden (default)
            //.primaryOverlay
            //.automatic
        }
        
        return true
    }

}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

