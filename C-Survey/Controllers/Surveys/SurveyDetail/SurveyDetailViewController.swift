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
        let nib = UINib(nibName: SurveyDetail.nib.name, bundle: nil)
        questionsCollectionView.register(nib, forCellWithReuseIdentifier: SurveyDetail.cell.name)
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
            
            // Get current answer.
            
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SurveyDetail.cell.name, for: indexPath) as? SurveyDetailViewCell else {
            return UICollectionViewCell()
        }
        if let cellView = cell.componentView {
            // Reload data.
            print("Don't need to create data for \(String(describing: type(of: cellView)))")
        } else {
            if indexPath.row % 2 == 0 {
                // Set view if have no value.
                guard let single = Bundle.main.loadNibNamed("SingleChoiceUIView", owner: self, options: nil)?[0] as? SingleChoiceUIView else {
                    return cell
                }
                cell.componentView = single
            } else {
                // Set view if have no value.
                guard let single = Bundle.main.loadNibNamed("MultipleChoiceUIView", owner: self, options: nil)?[0] as? MultipleChoiceUIView else {
                    return cell
                }
                cell.componentView = single
            }
            
        }
        return cell
    }
    
    // MARK: Cell size.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
