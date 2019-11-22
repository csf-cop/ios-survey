//
//  MainTabbarViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/8/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialItem()
    }

    private func initialItem() {
        // Do any additional setup after loading the view.
        let homeViewController = HomeViewController()
        homeViewController.viewModel = HomeViewModel()
        let homeNavi = UINavigationController(rootViewController: homeViewController)
        homeNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "home_selected"))
        
        let userSurveysController = UserSurveysViewController()
        userSurveysController.viewModel = UserSurveysViewModel()
        let userSurveysNavi = UINavigationController(rootViewController: userSurveysController)
        userSurveysNavi.tabBarItem = UITabBarItem(title: "Surveys", image: UIImage(named: "surveys" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "surveys_selected"))
        
        let userInforController = UserInformationViewController()
        let userNavi = UINavigationController(rootViewController: userInforController)
        userNavi.tabBarItem = UITabBarItem(title: "User info", image: UIImage(named: "profile" )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "profile_selected"))
        
        viewControllers = [homeNavi, userSurveysNavi, userNavi]
    }
}
