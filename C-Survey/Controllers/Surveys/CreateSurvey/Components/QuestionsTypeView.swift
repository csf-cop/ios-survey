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
            questionsTypeLoadedView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
            questionsTypeLoadedView.dataSource = self
            questionsTypeLoadedView.delegate = self
            
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    // MARK: Demo display title.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header of \(viewModel!.titleForHeaderInSection(section: section) ?? "Default header")"
    }
    
    // MARK: Demo display footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footer of \(viewModel!.titleForFooterInSection(section: section) ?? "Default footer")"
    }
}
