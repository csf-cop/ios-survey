//
//  QuestionsTypeViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/14/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class QuestionsTypeViewModel {
    
    private var data = [[ViewModelItem]]()
    private var options = [ViewModelItem]()
    
    init() {
        let question = QuestionContentCellModel()
        data.append([question])
        let single = SingleChoiceCellModel()
        options.append(single)
        data.append(options)
    }
    
    func numberOfSections() -> Int {
        return data.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return data[section].count
    }
    
    func titleForHeaderInSection(section: Int) -> String? {
        return String(section)
    }
    
    func titleForFooterInSection(section: Int) -> String? {
        return String(section)
    }
    
    func cellData(index: IndexPath) -> ViewModelItem {
        return data[index.section][index.row]
    }
}
