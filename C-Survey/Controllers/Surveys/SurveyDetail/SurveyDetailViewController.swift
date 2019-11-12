//
//  SurveyDetailViewController.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class SurveyDetailViewController: BaseViewController {

    var viewModel: SurveyDetailViewModel?
    @IBOutlet weak var questionsCollectionView: UICollectionView!
    @IBOutlet weak var questionNumberControl: UIPageControl!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var backQuestionButton: UIButton!
    
    private var startPosition = 0
    private var totalQuestions = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Survey detail"
    }
    
    override func settingUI() {
        
    }
    
    override func settingData() {
        questionsCollectionView.register(UIView.self, forCellWithReuseIdentifier: SurveyDetail.cell.name)
        questionsCollectionView.dataSource = self
        questionsCollectionView.delegate = self
    }
    
    @IBAction func previousQuestionButtonClick(_ sender: UIButton) {
        print("Previous question.")
        if (startPosition > 0) {
            startPosition -= 1
            let indexPath = IndexPath(item: startPosition, section: 0)
            questionsCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
    
    @IBAction func nextQuestionButtonClick(_ sender: UIButton) {
        print("Next question.")
        if (startPosition < totalQuestions - 1) {
            startPosition += 1
            let indexPath = IndexPath(item: startPosition, section: 0)
            questionsCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
}

extension SurveyDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalQuestions
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveyDetail.cell.name, for: indexPath) as? UIView else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .green
        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
//        label.text = String(indexPath.row)
//        label.textAlignment = .center
//        cell.contentView.addSubview(label)
//        // Constrain label
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        return cell
    }
    
    // MARK: Cell size.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
