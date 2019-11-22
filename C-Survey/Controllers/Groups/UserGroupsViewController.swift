//
//  UserGroupsViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/22/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class UserGroupsViewController: BaseViewController {

    @IBOutlet weak var groupsCollectionView: UICollectionView!
    // MARK: Demo display name.
    let nameRandom = ["Anna", "Hushka", "Jenny", "Churck", "Berge"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func settingData() {
        let nib = UINib(nibName: SurveysCategoryType.nib.name, bundle: nil)
        groupsCollectionView.register(nib, forCellWithReuseIdentifier: SurveysCategoryType.cell.name)
        
        groupsCollectionView.dataSource = self
        groupsCollectionView.delegate = self
    }
}

extension UserGroupsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveysCategoryType.cell.name, for: indexPath) as? SurverCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 15
//        cell.viewModel = SurveyCategoryCellViewModel(id: indexPath.row, value: String(indexPath.section))
        
        let name = nameRandom[Int.random(in: 0...4)]
        // Initial with name.
        let profileLabel = UILabel()
        profileLabel.textColor = .white
        profileLabel.font = UIFont(name: "System", size: 22)
        profileLabel.text = String(name.first!)
        profileLabel.textAlignment = .center
        cell.contentView.addSubview(profileLabel)
        
        // MARK: Setting label anchor.
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        profileLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = view.frame.width / 2 - 5
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}

extension UserGroupsViewController: SurverCategoryCellDelegate {
    func clickToCategory(view: SurverCategoryCollectionViewCell, value: Int) {
        let surveysViewController = SurveysByCategoryViewController()
        surveysViewController.viewModel = SurveysByCategoryViewModel(id: String(value))
        navigationController?.pushViewController(surveysViewController, animated: true)
    }
}
