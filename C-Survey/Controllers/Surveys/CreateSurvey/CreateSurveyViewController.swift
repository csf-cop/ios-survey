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
        guard let nib = Bundle.main.loadNibNamed("QuestionsTypeView", owner: self, options: nil)?[0] as? QuestionsTypeView else {
            return
        }
        nib.viewModel = QuestionsTypeViewModel()
        addQuestionView.addSubview(nib)
    }

}
