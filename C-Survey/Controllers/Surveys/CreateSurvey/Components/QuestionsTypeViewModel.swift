//
//  QuestionsTypeViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/14/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class QuestionsTypeViewModel {
    
//    private var data: [[String]] = [["test question"], ["test options"]]
//    private var index: [String] = ["Question", "Options"]
    
    private var data = [ViewModelItem]()
    
    init() {
        let question = QuestionContentCellModel()
        data.append(question)
        let single = SingleChoiceCellModel()
        data.append(single)
        let multiple = MultipleChoiceCellModel()
        data.append(multiple)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return data.count
    }
    
    func titleForHeaderInSection(section: Int) -> String? {
        return String(section)
    }
    
    func titleForFooterInSection(section: Int) -> String? {
        return String(section)
    }
    
    func cellData(index: IndexPath) -> ViewModelItem {
        return data[index.row]
    }
}
