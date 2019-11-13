//
//  Question.swift
//  C-Survey
//
//  Created by MBA0051 on 11/13/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

protocol Question {
    func getAnswer(visit: QuestionType) -> [String]
}

protocol QuestionType {
    func getAnswer(for singleChoice: SingleSelectUIView) -> [String]
    func getAnswer(for multipleChoice: MultipleChoiceUIView) -> [String]
}

class QuestionTypeVisitor: QuestionType {
    func getAnswer(for singleChoice: SingleSelectUIView) -> [String] {
        return []
    }
    
    func getAnswer(for multipleChoice: MultipleChoiceUIView) -> [String] {
        return multipleChoice.getAnswer()
    }
    
    func getAnswer(for singleChoice: SingleSelectUIView) {
        
    }
    
    func getAnswer(for multipleChoice: MultipleChoiceUIView) {
        
    }
    
    
}
