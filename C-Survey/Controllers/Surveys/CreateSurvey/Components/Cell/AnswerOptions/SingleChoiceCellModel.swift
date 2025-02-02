//
//  SingleChoiceCell.swift
//  C-Survey
//
//  Created by MBA0051 on 11/14/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class SingleChoiceCellModel: ViewModelItem {
    
    var type: ViewModelItemType {
        return .singleChoice
    }
    var section: String {
        return "Single cell"
    }
    var rowCount: Int {
        return 1
    }
    
    // MARK: Insert more property and init method if nessesary.
}
