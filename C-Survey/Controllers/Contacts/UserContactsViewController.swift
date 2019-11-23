//
//  UserContactsViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/22/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class UserContactsViewController: BaseViewController {

    @IBOutlet weak var searchContactButton: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    var viewModel: UserContactsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func settingData() {
        contactsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
    }
}

extension UserContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = .yellow
        cell.textLabel?.text = viewModel?.cellData(index: indexPath)
        return cell
    }
    
    
}
