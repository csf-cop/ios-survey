//
//  UserSurveysViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class UserSurveysViewController: BaseViewController {

    @IBOutlet weak var editBarButton: UIBarButtonItem!
    var viewModel: UserSurveysViewModel?
    @IBOutlet weak var userSurveysTableView: UITableView!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func settingUI() {
        displayDeleteButton(display: false)
        // Setting long press
        setupLongPressGesture()
    }
    
    private func displayDeleteButton(display: Bool) {
//        if display == false {
//            deleteButton.isHidden = true
//            deleteButton.frame.size.height = 0
//            userSurveysTableView.translatesAutoresizingMaskIntoConstraints = false
//            userSurveysTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        } else {
//            deleteButton.isHidden = false
//            deleteButton.frame.size.height = 50
//            userSurveysTableView.translatesAutoresizingMaskIntoConstraints = false
//            userSurveysTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = false
//        }
    }
    
    // MARK: Initial LongPress
    private func setupLongPressGesture() {
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        userSurveysTableView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .ended {
            if userSurveysTableView.isEditing == false {
                userSurveysTableView.setEditing(true, animated: true)
                displayDeleteButton(display: true)
            }
        }
    }
    
    override func settingData() {
        let nib = UINib(nibName: UserSurveys.nib.name, bundle: nil)
        userSurveysTableView.register(nib, forCellReuseIdentifier: UserSurveys.cell.name)
        userSurveysTableView.dataSource = self
        userSurveysTableView.delegate = self
    }
    
    @IBAction func deleteSurveyButtonClick(_ sender: UIButton) {
        if userSurveysTableView.isEditing == true {
            userSurveysTableView.setEditing(false, animated: true)
            displayDeleteButton(display: false)
        }
    }
    @IBAction func createSurvey(_ sender: UIBarButtonItem) {
        // MARK: Create survey. - Include done edit.
        let newSurvey = CreateSurveyViewController()
        navigationController?.pushViewController(newSurvey, animated: true)
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
    
    // MARK: Show delete button.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete row.
            if let viewModel = self.viewModel {
                viewModel.removeAt(at: indexPath)
                userSurveysTableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    // MARK: Catch swiper right to left orient.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletedAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completion) in
            // Delete cell in data source
            if let viewModel = self.viewModel {
                viewModel.removeAt(at: indexPath)
                self.userSurveysTableView.deleteRows(at: [indexPath], with: .fade)
                // MARK: Call to handler completion.
                completion(true)
            }
        }
        // deletedAction.image =
        deletedAction.backgroundColor = .green
        let swipeConfig = UISwipeActionsConfiguration(actions: [deletedAction])
        return swipeConfig
    }
    
    // MARK: Disable editing rows.
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK: Hide delete button.
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if (indexPath.row % 5 == 0) {
            return UITableViewCell.EditingStyle.none
        } else if (indexPath.row % 4 == 0) {
            return UITableViewCell.EditingStyle.insert
        }
        print("display")
        return UITableViewCell.EditingStyle.delete
    }
    
    // MARK: Show order by.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
