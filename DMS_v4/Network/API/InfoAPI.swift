//
//  InfoAPI.swift
//  DMS_v4
//
//  Created by leedonggi on 2020/06/18.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import Foundation

public enum InfoAPI: API {
    case getApplyInfo
    
    func getPath() -> String {
        switch self {
        case .getApplyInfo:
            return "info/apply"
        }
    }
}
