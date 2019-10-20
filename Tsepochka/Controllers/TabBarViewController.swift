//
//  TabBarViewController.swift
//  Tsepochka
//
//  Created by Daulet Kenzhetayev on 12/23/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation
import UIKit
import FoldingTabBar

class TabBarViewController: YALFoldingTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstItem = YALTabBarItem(
            itemImage: UIImage(named: "sampleIcon"),
            leftItemImage: UIImage(named: "sampleIcon"),
            rightItemImage: UIImage(named: "sampleIcon")
        )
        let secondItem = YALTabBarItem(
            itemImage: UIImage(named: "sampleIcon"),
            leftItemImage: UIImage(named: "sampleIcon"),
            rightItemImage: UIImage(named: "sampleIcon")
        )
        
        tabBarView.backgroundColor = .blue
        
        centerButtonImage = UIImage(named: "plusIcon")!
        leftBarItems = [firstItem]
        rightBarItems = [secondItem]
        
        //customize tabBarView
        tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
        tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
        tabBarView.backgroundColor = UIColor(red: 94.0/255.0, green: 91.0/255.0, blue: 149.0/255.0, alpha: 1)
        
        tabBarView.tabBarColor = UIColor(red: 72.0/255.0, green: 211.0/255.0, blue: 178.0/255.0, alpha: 1)
        tabBarViewHeight = YALTabBarViewDefaultHeight;
        tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
        tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
        
        self.viewControllers = [UINavigationController.init(rootViewController: StatisticsViewController()), UINavigationController.init(rootViewController: NewsViewController())]
        
        self.view.addSubview(tabBarView)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        tabBarView.anchorToEdge(.bottom, padding: 0, width: self.view.frame.width/2, height: 44)
    }
    
    func tabBarDidSelectExtraLeftItem(tabBar: YALFoldingTabBar!) {
        print("Left")
    }
    
    func tabBarDidSelectExtraRightItem(tabBar: YALFoldingTabBar!) {
        print("Right")
    }
    
}

