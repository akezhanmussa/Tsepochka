//
//  AppDelegate.swift
//  Tsepochka
//
//  Created by Daulet Kenzhetayev on 12/23/17.
//  Copyright © 2017 mad. All rights reserved.
//

import UIKit
import Neon
import FoldingTabBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let vc = TabBarViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
//        setupYALTabBarController()
        return true
    }
    
    func setupYALTabBarController() {
        guard let tabBarController = window?.rootViewController as? YALFoldingTabBarController else { return }
        
        let item1 = YALTabBarItem(itemImage: UIImage(named: "sampleIcon"), leftItemImage: nil, rightItemImage: nil)
        let item2 = YALTabBarItem(itemImage: UIImage(named: "sampleIcon"), leftItemImage: UIImage(named: "sampleIcon"), rightItemImage: nil)
        tabBarController.leftBarItems = [item1, item2]
        
        
        let item3 = YALTabBarItem(itemImage: UIImage(named: "sampleIcon"), leftItemImage: UIImage(named: "sampleIcon"), rightItemImage: UIImage(named: "sampleIcon"))
        let item4 = YALTabBarItem(itemImage: UIImage(named: "sampleIcon"), leftItemImage: nil, rightItemImage: nil)
        tabBarController.rightBarItems = [item3, item4]
        
        tabBarController.centerButtonImage = UIImage(named:"sampleIcon")!
        tabBarController.selectedIndex = 2
        
        
    }

}

