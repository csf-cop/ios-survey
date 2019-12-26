//
//  SurveyDetailViewCell.swift
//  C-Survey
//
//  Created by MBA0051 on 11/12/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class SurveyDetailViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    
    var componentView: UIView? {
        didSet {
            // Load nib from view.
            // first: load the view hierarchy to get proper outlets
            if let componentView = componentView {
                let name = String(describing: type(of: componentView))
                print("Component name: \(name.description)")
                mainView.addSubview(componentView)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
