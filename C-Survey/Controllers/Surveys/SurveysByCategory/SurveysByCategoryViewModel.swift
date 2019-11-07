//
//  SurveysByCategoryViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/7/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class SurveysByCategoryViewModel {
 
    private var categoryId: String
    private var surveys: [String]
    
    init(id: String) {
        self.categoryId = id
        self.surveys = []
        for index in 0..<50 {
            self.surveys.append(String(index))
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return surveys.count
    }
    
    func getCellModel(index: IndexPath) -> SurveysByCategoryCellModel? {
        if (index.row > surveys.count) { return nil }
        let cellModel = SurveysByCategoryCellModel()
        cellModel.id = index.row
        cellModel.displayValue = surveys[index.row]
        return cellModel
    }
}
