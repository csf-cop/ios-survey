//
//  SurverCategoryCollectionViewCell.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

protocol SurverCategoryCellDelegate: class {
    func clickToCategory(view: SurverCategoryCollectionViewCell, value: Int)
}

class SurverCategoryCollectionViewCell: UICollectionViewCell {

    weak var delegate: SurverCategoryCellDelegate?
    @IBOutlet weak var displayValueButton: UIButton!
    private var cellIndex: Int = 0
    
    var viewModel: SurveyCategoryCellViewModel? {
        didSet {
            self.cellIndex = viewModel!.id
            self.displayValueButton.setTitle(viewModel?.displayValue, for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func showCategoryDetailButtonClick(_ sender: UIButton) {
        delegate?.clickToCategory(view: self, value: cellIndex)
    }
    
}
