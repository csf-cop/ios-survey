//
//  RepeatDomain.swift
//  C-Survey
//
//  Created by MBA0051 on 11/11/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation
import ObjectMapper

class RepeatDomain: Mappable {
    
    var repeat_type: String = ""
    var repeat_id: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        repeat_type <- map["repeat_type"]
        repeat_id <- map["repeat_id"]
    } 
}
