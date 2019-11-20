//
//  QuestionsTypeView.swift
//  C-Survey
//
//  Created by MBA0051 on 11/14/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class QuestionsTypeView: UIView {

    @IBOutlet weak var questionsTypeLoadedView: UITableView!
    var viewModel: QuestionsTypeViewModel? {
        didSet {
            // Load Header
            questionsTypeLoadedView.register(QuestionContentCell.nib, forCellReuseIdentifier: QuestionContentCell.identifier)
            questionsTypeLoadedView.register(SingleChoiceCell.nib, forCellReuseIdentifier: SingleChoiceCell.identifier)
            questionsTypeLoadedView.register(MultipleChoiceCell.nib, forCellReuseIdentifier: MultipleChoiceCell.identifier)
            questionsTypeLoadedView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
            
            questionsTypeLoadedView.dataSource = self
            questionsTypeLoadedView.delegate = self
            questionsTypeLoadedView.sectionHeaderHeight = 100
            
            let headerNib = UINib(nibName: "QuestionFooterView", bundle: nil)
            questionsTypeLoadedView.register(headerNib, forHeaderFooterViewReuseIdentifier: "QuestionFooterView")
        }
    }
}

extension QuestionsTypeView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let item = viewModel?.cellData(index: indexPath) else {
            return UITableViewCell()
        }
        switch item.type {
        case .question:
            if let cell = tableView.dequeueReusableCell(withIdentifier: QuestionContentCell.identifier, for: indexPath) as? QuestionContentCell {
                return cell
            }
        case .singleChoice:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SingleChoiceCell.identifier, for: indexPath) as? SingleChoiceCell {
                return cell
            }
        case .multipleChoice:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MultipleChoiceCell.identifier, for: indexPath) as? MultipleChoiceCell {
                return cell
            }
        case .addMore:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // MARK: Case use for customView.
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QuestionFooterView") as? QuestionFooterView {
            return header
        }
        return UIView()
    }
}
