//
//  QuestionsTypeViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/14/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class QuestionsTypeViewModel {
    
    private var data: [[String]] = [["test question"], ["test options"]]
    private var index: [String] = ["Question", "Options"]
    
    func numberOfSections() -> Int {
        return index.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return data[section].count
    }
    
    func titleForHeaderInSection(section: Int) -> String? {
        return index[section]
    }
    
    func titleForFooterInSection(section: Int) -> String? {
        return index[section]
    }
}
