//
//  UserSurveysViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/8/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class UserSurveysViewModel {
    
    var data: [[String]] = []
    var indexs: [String] = []
    
    init() {
        var temp: [String] = []
        for index in 0..<2 {
            temp = []
            for number in 0..<25 {
                temp.append(String(index + 1) + "_" + String(number))
            }
            indexs.append("Header : \(index + 1)")
            data.append(temp)
        }
    }
    
    func numberOfSections() -> Int {
        return indexs.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return data[section].count
    }
    
    func getCellModel(at: IndexPath) -> UserSurveyCellViewModel {
        return UserSurveyCellViewModel()
    }
    
    func getHeader(at: Int) -> String? {
        return indexs[at]
    }
    
    func removeAt(at: IndexPath) {
        data[at.section].remove(at: at.row)
    }
}
