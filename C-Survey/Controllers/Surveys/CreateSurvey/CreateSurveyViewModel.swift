//
//  CreateSurveyViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/20/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class CreateSurveyViewModel {
    
    private var questionTypes: [String]
    init() {
        questionTypes = []
        questionTypes.append("Single Choice")
        questionTypes.append("Multiple Choice")
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return questionTypes.count
    }
    
    func questionTypes(at: IndexPath) -> String? {
        return questionTypes[at.row]
    }
}
