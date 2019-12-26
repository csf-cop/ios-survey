//
//  QuestionContentCellModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/20/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class QuestionContentCellModel: ViewModelItem {
    
    var type: ViewModelItemType {
        return .question
    }
    var section: String {
        return "Question content"
    }
    var rowCount: Int {
        return 1
    }
    
    
}
