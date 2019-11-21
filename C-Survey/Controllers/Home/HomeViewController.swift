//
//  HomeViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var surveysTypeCollectionView: UICollectionView!
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func settingUI() {
        
    }
    
    override func settingData() {
        // Register for collection view cell.
        let nib = UINib(nibName: SurveysCategoryType.nib.name, bundle: nil)
        surveysTypeCollectionView.register(nib, forCellWithReuseIdentifier: SurveysCategoryType.cell.name)
        // Register for header
        surveysTypeCollectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SurveysCategoryType.cell.name)
        surveysTypeCollectionView.dataSource = self
        surveysTypeCollectionView.delegate = self
        
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfSections()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfItemsInSection(section: section)
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveysCategoryType.cell.name, for: indexPath) as? SurverCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
        cell.viewModel = SurveyCategoryCellViewModel(id: indexPath.row, value: String(indexPath.section))
        cell.delegate = self
        return cell
    }
    
    // MARK: Display header in collection.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SurveysCategoryType.cell.name, for: indexPath) as UICollectionReusableView
            
            // Setting to label.
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: header.frame.width, height: header.frame.height))
            label.text = viewModel!.getHeader(section: indexPath.section)
            label.textAlignment = .left
            header.addSubview(label)
            // Constrain label
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
            return header

        default:
            return UICollectionReusableView()
        }
    }
    
    // MARK: Setting size for header.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    // MARK: Setting label to display in cell.
    private func settingCellData(cell: UICollectionViewCell, indexPath: IndexPath) {
        // Setting to label.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        label.text = viewModel!.getCellModel(indexPath: indexPath)
        label.textAlignment = .center
        label.textColor = .white
        
        cell.contentView.addSubview(label)

        // Constrain label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
    }
}

extension HomeViewController: SurverCategoryCellDelegate {
    func clickToCategory(view: SurverCategoryCollectionViewCell, value: Int) {
        let surveysViewController = SurveysByCategoryViewController()
        surveysViewController.viewModel = SurveysByCategoryViewModel(id: String(value))
        navigationController?.pushViewController(surveysViewController, animated: true)
    }
}
