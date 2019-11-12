//
//  LoginViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit
import ObjectMapper

class LoginViewController: BaseViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func checkLoginButtonClick(_ sender: UIButton) {
        // MARK: Move to Main page.
         AppDelegate.shared.window?.rootViewController = MainTabbarViewController()
        
        
        // MARK: Run test demo convert json response data to Object.
//        loadDataFromJsonFile(file: "response_question.json")
    }
    
    func loadDataFromJsonFile(file: String) {
        if let path = Bundle.main.path(forResource: "response_question", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    if let jsonData = jsonResult["data"] as? [String: Any] {
                        if let questions = jsonData["questions"] as? [[String: Any]] {
                            let dataQuestion = Mapper<QuestionDomain>().mapArray(JSONArray: questions)
                            for index in dataQuestion {
                                print("Number if answer: \(index.answers.count)")
                                print("repeat: \(index.repeat_status.repeat_id)")
                            }
                        }
                    }
                }
                // Cast to object.
            } catch {
               // handle error
            }
        }
    }
}
