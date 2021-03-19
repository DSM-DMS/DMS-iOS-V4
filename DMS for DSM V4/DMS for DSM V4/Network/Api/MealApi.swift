//
//  MealApi.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import Foundation

public enum MealAPI: API {
    case getMealInfo(date: String)
    
    func getPath() -> String {
        switch self {
            case .getMealInfo(let date): return "meal/\(date)"
        }
    }
}
