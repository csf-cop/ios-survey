//
//  UserSurveyViewCell.swift
//  C-Survey
//
//  Created by MBA0051 on 11/8/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class UserSurveyViewCell: UITableViewCell {

    @IBOutlet weak var displayValueLabel: UILabel!
    var viewModel: UserSurveyCellViewModel? {
        didSet {
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
