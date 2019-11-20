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
    @IBOutlet weak var questionTypesTableView: UITableView!
    var viewModel = CreateSurveyViewModel()
    @IBOutlet weak var questionTypesButton: UIButton!
    private var currentQuestionType: String = ""
    
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
        
        questionTypesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuestionTypes")
        questionTypesTableView.dataSource = self
        questionTypesTableView.delegate = self
    }

    @IBAction func showQuestionTypesButtonClick(_ sender: UIButton) {
        questionTypesTableView.isHidden = false
    }
}

extension CreateSurveyViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTypes", for: indexPath)
        cell.textLabel?.text = viewModel.questionTypes(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.questionTypesButton.setTitle(viewModel.questionTypes(at: indexPath), for: .normal)
        self.currentQuestionType = self.viewModel.questionTypes(at: indexPath) ?? ""
        self.questionTypesTableView.isHidden = true
    }
}
