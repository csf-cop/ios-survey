//
//  QuestionDomain.swift
//  C-Survey
//
//  Created by MBA0051 on 11/11/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation
import ObjectMapper

class QuestionDomain : Mappable {
    typealias JSON = [String: Any]
    
    var question_id: String = ""
    var question_type: String = ""
    var content: String = ""
    var explanation: String = ""
    var answers: [AnswerDomain] = []
    var prev_question: String = ""
    var next_question: String = ""
    var repeat_status: RepeatDomain = RepeatDomain()
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        question_id <- map["question_id"]
        question_type <- map["question_type"]
        content <- map["content"]
        explanation <- map["explanation"]
        answers <- map["answers"]
        prev_question <- map["prev_question"]
        next_question <- map["next_question"]
        repeat_status <- map["repeat"]
    }
}
