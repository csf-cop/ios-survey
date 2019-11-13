//
//  MultipleChoiceUIView.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import UIKit

class MultipleChoiceUIView: UIView {

    func getAnswer() -> [String] {
        return ["test"]
    }
}

extension MultipleChoiceUIView: Question {
    func getAnswer(visit: QuestionType) -> [String] {
        return visit.getAnswer(for: self)
    }
}
