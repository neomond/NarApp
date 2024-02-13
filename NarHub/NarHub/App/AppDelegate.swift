//
//  AppDelegate.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        App.router.start()
        
        return true
    }


}

