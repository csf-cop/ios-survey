//
//  BaseIdentity.swift
//  C-Survey
//
//  Created by MBA0051 on 11/7/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation

enum SurveysByCategory {
    case cell
    case nib
    
    var name: String {
        switch self {
        case .cell: return "SurveysByCategoryCell"
        case .nib: return "SurveysByCategoryViewCell"
        }
    }
}

enum SurveysCategoryType {
    case cell
    case nib
    case header
    
    var name: String {
        switch self {
        case .cell: return "SurverCategoryCell"
        case .nib: return "SurverCategoryCollectionViewCell"
        case .header: return "SurverCategoryCollectionCellHeader"
        }
    }
}

enum UserSurveys {
    case cell
    case nib
    case header
    
    var name: String {
        switch self {
        case .cell: return "UserSurveyCell"
        case .nib: return "UserSurveyViewCell"
        case .header: return "UserSurveyCellHeader"
        }
    }
}

enum SurveyDetail {
    case cell
    case nib
    
    var name: String {
        switch self {
        case .cell: return "SurveyDetailCell"
        case .nib: return "SurveyDetailViewCell"
        }
    }
}
enum CustomNibView {
    case addSingle
    case addMultiple
    case singleDetail
    case multipleDetail
    
    var name: String {
        switch self {
        case .addSingle: return "SingleChoiceQuestion"
        case .addMultiple: return ""
        case .singleDetail: return "SingleChoiceUIView"
        case .multipleDetail: return "MultipleChoiceUIView"
        }
    }
}
