//
//  UserSurveyViewCell.swift
//  C-Survey
//
//  Created by MBA0051 on 11/8/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class UserSurveyViewCell: UITableViewCell {

    var viewModel: UserSurveyCellViewModel? {
        didSet {
            print("Setting to user survey.")
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
