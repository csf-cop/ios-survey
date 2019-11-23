//
//  UserContactsViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/23/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class UserContactsViewModel {
    
    private var demoData = ["Contact 1", "Contact 2"]
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return demoData.count
    }
    
    func cellData(index: IndexPath) -> String? {
        return demoData[index.row]
    }
}
