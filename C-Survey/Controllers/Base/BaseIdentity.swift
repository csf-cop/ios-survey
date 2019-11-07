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
