//
//  InfoAPI.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
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
