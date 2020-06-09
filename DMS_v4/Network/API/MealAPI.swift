//
//  MealAPI.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/06/09.
//  Copyright © 2020 leedonggi. All rights reserved.
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
