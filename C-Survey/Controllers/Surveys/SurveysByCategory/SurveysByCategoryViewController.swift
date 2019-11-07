//
//  SurveysByCategoryViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/7/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class SurveysByCategoryViewController: BaseViewController {

    var viewModel: SurveysByCategoryViewModel?
    @IBOutlet weak var surveysTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func settingData() {
        let nib = UINib(nibName: SurveysByCategory.nib.name, bundle: nil)
        surveysTableView.register(nib, forCellReuseIdentifier: SurveysByCategory.cell.name)
        surveysTableView.dataSource = self
        surveysTableView.delegate = self
    }
}

extension SurveysByCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SurveysByCategory.cell.name, for: indexPath) as? SurveysByCategoryViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .orange
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }
}
