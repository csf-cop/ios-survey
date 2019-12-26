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
            questionsTypeLoadedView.dataSource = self
            questionsTypeLoadedView.delegate = self
//            questionsTypeLoadedView.sectionHeaderHeight = 100
            
            questionsTypeLoadedView.register(QuestionFooterView.nib, forHeaderFooterViewReuseIdentifier: QuestionFooterView.identifier)
            
            // MARK: Custom for hide some cell.
            questionsTypeLoadedView.contentInset = UIEdgeInsets(top: -1, left: 0, bottom: 0, right: 0)
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
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    // MARK: Demo display title.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Question section"
        case 1:
            return "Question options"
        default:
            break
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: QuestionFooterView.identifier) as? QuestionFooterView {
//                header.delegate = self
                return header
            }
        }
        return nil
    }
    
    // MARK: Hide first footer.
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 1.0 : 32
    }
}

extension QuestionsTypeView: QuestionFooterViewDelegate {
    func addMoreOptions(view: QuestionFooterView, type: Int) {
        switch type {
        case AddMoreType.answerOptions.value:
//            print("Click to \(view.description) with type: \(type)")
            if let viewModel = self.viewModel {
                viewModel.addNewOption(section: 1)
                self.questionsTypeLoadedView.reloadData()
            }
        default:
            print("Fail click.")
        }
        
    }
}
