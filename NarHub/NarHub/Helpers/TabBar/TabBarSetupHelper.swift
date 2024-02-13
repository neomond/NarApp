//
//  TabBarSetupHelper.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 05.02.24.
//

import UIKit

class TabBarSetupHelper {
    static func createTabBarItems() -> [UIViewController] {
        // Home
        let homeVC = DashboardViewController()
        let homeView = MainNavigation(rootViewController: DashboardConfigurator.configure(homeVC))
        homeView.tabBarItem = UITabBarItem(title: "Əsas", image: AppAssets.main.load(), tag: 0)
        
        // Internet
        let internetVC = DashboardViewController()
        let internetView = MainNavigation(rootViewController: DashboardConfigurator.configure(internetVC))
        internetView.tabBarItem = UITabBarItem(title: "İnternet", image: AppAssets.internet.load(), tag: 1)
        
        // Middle Tab
        let dashboardVC = DashboardViewController()
        let dashboardView = MainNavigation(rootViewController: DashboardConfigurator.configure(dashboardVC))
        dashboardView.tabBarItem = UITabBarItem()
        dashboardView.tabBarItem.title = ""
        dashboardView.tabBarItem.image = UIImage.add
        dashboardView.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        dashboardView.tabBarItem.isEnabled = false
        
        // Support
        let supportVC = DashboardViewController()
        let supportView = MainNavigation(rootViewController: DashboardConfigurator.configure(supportVC))
        supportView.tabBarItem = UITabBarItem(title: "Dəstək", image: AppAssets.support.load(), tag: 2)
        
        // Account
        let accountVC = DashboardViewController()
        let accountView = MainNavigation(rootViewController: DashboardConfigurator.configure(accountVC))
        accountView.tabBarItem = UITabBarItem(title: "Hesabım", image: AppAssets.account.load(), tag: 3)
        
        
        let controllers = [homeView, internetView, dashboardView, supportView, accountView]
        return controllers
    }
}

