//
//  WelcomeViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "This is welcome page."
    }
    @IBAction func goToLoginPageButtonClick(_ sender: UIButton) {
        let loginView = LoginViewController()
        navigationController?.pushViewController(loginView, animated: true)
    }
}
