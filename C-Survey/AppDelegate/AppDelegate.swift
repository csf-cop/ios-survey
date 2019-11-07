//
//  AppDelegate.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mask: CALayer?
    var imageView: UIImageView?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        loadWelcomePage()
        return true
    }
    
    private func loadWelcomePage() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let viewController = WelcomeViewController()
        let navi = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
    }
}

