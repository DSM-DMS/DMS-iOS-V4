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
    case getBasicInfo
    
    func getPath() -> String {
        switch self {
        case .getApplyInfo:
            return "info/apply"
        case .getBasicInfo:
            return "info/basic"
        }
    }
}
