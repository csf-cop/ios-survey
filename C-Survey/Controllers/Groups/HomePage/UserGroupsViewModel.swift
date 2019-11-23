//
//  UserGroupsViewModel.swift
//  C-Survey
//
//  Created by MBA0051 on 11/23/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

class UserGroupsViewModel {
    
    // MARK: Demo display name.
    let nameRandom = ["Anna", "Hushka", "Jenny", "Churck", "Berge"]

    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return nameRandom.count
    }
    
    func cellData(_ index: IndexPath) -> String? {
        return nameRandom[Int.random(in: 0...4)]
    }
    
}
