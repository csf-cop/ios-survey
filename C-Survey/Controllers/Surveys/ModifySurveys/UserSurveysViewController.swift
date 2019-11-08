//
//  UserSurveysViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class UserSurveysViewController: BaseViewController {

    var viewModel: UserSurveysViewModel?
    @IBOutlet weak var userSurveysTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "User's surveys"
    }
    
    override func settingData() {
        let nib = UINib(nibName: UserSurveys.nib.name, bundle: nil)
        userSurveysTableView.register(nib, forCellReuseIdentifier: UserSurveys.cell.name)
        userSurveysTableView.dataSource = self
        userSurveysTableView.delegate = self
    }
}

extension UserSurveysViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel!.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserSurveys.cell.name, for: indexPath) as? UserSurveyViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel!.getCellModel(at: indexPath)
        return cell
    }
    
    /**
     * Setting header section.
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel!.getHeader(at: section)
    }
    
    /*
     * Setting index for table view.
     */
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
