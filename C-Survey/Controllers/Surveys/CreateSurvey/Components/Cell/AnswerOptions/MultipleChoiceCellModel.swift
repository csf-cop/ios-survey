//
//  MultipleChoiceCellModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/14/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class MultipleChoiceCellModel: ViewModelItem {
    
    var type: ViewModelItemType {
        return .multipleChoice
    }
    var section: String {
        return "multiple cell"
    }
    var rowCount: Int {
        return 1
    }
}
