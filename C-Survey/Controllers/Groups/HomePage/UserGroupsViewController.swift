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
    var viewModel: UserGroupsViewModel?

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
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveysCategoryType.cell.name, for: indexPath) as? SurverCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 15
        
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
