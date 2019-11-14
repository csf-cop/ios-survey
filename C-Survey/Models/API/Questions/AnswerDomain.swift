//
//  AnswerDomain.swift
//  C-Survey
//
//  Created by MBA0051 on 11/11/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation
import ObjectMapper

class AnswerDomain: Mappable {
    
    var answer_id: String = ""
    var answer_content: String = ""
    var answer_value: String = ""
    var answer_consequence: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        answer_id <- map["answer_id"]
        answer_content <- map["answer_content"]
        answer_value <- map["answer_value"]
        answer_consequence <- map["answer_consequence"]
    }
}
