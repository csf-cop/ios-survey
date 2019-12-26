//
//  BaseQuestionsTypeCell.swift
//  C-Survey
//
//  Created by MBA0051 on 11/14/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

enum QuestionsType {
    case singleChoice
    case multipleChoice
    case userComment
    
    var nib: String {
        switch self {
        case .singleChoice:
            return "SingleChoiceCell"
        case .multipleChoice:
            return "MultipleChoiceCell"
        case .userComment:
            return "UsersCommentCellModel"
        }
    }
    
    var value: Int {
        switch self {
        case .singleChoice:
            return 1
        case .multipleChoice:
            return 2
        case .userComment:
            return 3
        }
    }
}
