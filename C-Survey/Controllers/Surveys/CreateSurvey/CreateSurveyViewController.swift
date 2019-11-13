//
//  CreateSurveyViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class CreateSurveyViewController: BaseViewController {

    @IBOutlet weak var addQuestionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func settingUI() {
        guard let nib = Bundle.main.loadNibNamed("QuestionSingleChoice", owner: self, options: nil)?[0] as? QuestionSingleChoice else {
            return
        }
        addQuestionView.addSubview(nib)
    }

}
