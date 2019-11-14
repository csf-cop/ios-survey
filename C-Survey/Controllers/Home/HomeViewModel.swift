//
//  HomeViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var dummyData = [["Asiantech-all", "Java", "IOS", "Angular"], ["Viettel", "CMC", "Da Nang"]]
    var dummyIndex = ["Asiantech", "Public"]
    
    func numberOfSections() -> Int {
        return dummyData.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return dummyData[section].count
    }
    
    func getCellModel(indexPath: IndexPath) -> String {
        return dummyData[indexPath.section][indexPath.row]
    }
    
    func getHeader(section: Int) -> String {
        return dummyIndex[section]
    }
}
