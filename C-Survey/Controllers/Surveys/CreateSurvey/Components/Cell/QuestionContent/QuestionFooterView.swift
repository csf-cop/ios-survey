//
//  QuestionFooterView.swift
//  C-Survey
//
//  Created by MBA0051 on 11/20/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

protocol QuestionFooterViewDelegate {
    // MARK: Type based on AddMoreType value.
    func addMoreOptions(view: QuestionFooterView, type: Int)
}

class QuestionFooterView: UITableViewHeaderFooterView {
    
    var delegate: QuestionFooterViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func addMoreButtonClick(_ sender: UIButton) {
        delegate?.addMoreOptions(view: self, type: AddMoreType.answerOptions.value)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
