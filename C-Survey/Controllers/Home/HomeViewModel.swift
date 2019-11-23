//
//  HomeViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    
    private var dummyIndex = ["Hot survey", "Viettel surveys", "Public"]
    private var hotSurveys: [String]
    private var viettelSurveys: [String]
    private var compSurveys: [String]
    private var dummyData: [[String]]
    
    init() {
        hotSurveys = ["https://s7641.pcdn.co/wp-content/uploads/2017/08/survey.png",
        "https://metab.ern-net.eu/wp-content/uploads/2019/02/AdM_Survey_660x320.png",
        "https://st3.depositphotos.com/1826664/13072/i/1600/depositphotos_130720138-stock-photo-take-our-survey-pink-orange.jpg",
        "https://static.wixstatic.com/media/1320ea_7e9882d5640e43afb1809c59322fe5a6~mv2.jpg/v1/fill/w_1026,h_388,al_c/1320ea_7e9882d5640e43afb1809c59322fe5a6~mv2.jpg",
        "http://simpletasks.org/wp-content/uploads/2019/09/patient-survey-2019.jpg"]
        viettelSurveys = ["Khảo sát khách hàng về chế độ phục vụ", "Khảo sát về chất lượng kỹ thuật"]
        compSurveys = ["Khảo sát môi trường làm việc", "Khảo sát chế độ đãi ngộ", "Khảo sát con đường thăng tiến", "Khảo sát hiểu biết công ty"]
        dummyData = [hotSurveys, viettelSurveys, compSurveys]
    }
    
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
