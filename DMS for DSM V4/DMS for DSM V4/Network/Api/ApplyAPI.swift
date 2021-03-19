//
//  ApplyAPI.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import Foundation

public enum ApplyAPI: API {
    case getGoingOut
    case getExtensionMap(time: String, classNum: String)
    
    func getPath() -> String {
        switch self {
        case .getExtensionMap(let time, let classNum):
            return "apply/extension/map/\(time)/\(classNum)"
        case .getGoingOut:
            return "apply/stay"
        }
    }
}

