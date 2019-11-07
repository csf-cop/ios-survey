//
//  SurveysByCategoryViewCell.swift
//  C-Survey
//
//  Created by MBA0051 on 11/7/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class SurveysByCategoryViewCell: UITableViewCell {

    var viewModel: SurveysByCategoryCellModel? {
        didSet {
            print("Set value to cell.")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
