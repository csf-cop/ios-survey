//
//  SurveyCategoryCellModelView.swift
//  C-Survey
//
//  Created by MBA0051 on 11/7/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class SurveyCategoryCellViewModel {
    var id: Int
    var displayValue: String
    
    init() {
        id = 0
        displayValue = ""
    }
    
    init(id: Int, value: String) {
        self.id = id
        self.displayValue = value
    }
    
}
