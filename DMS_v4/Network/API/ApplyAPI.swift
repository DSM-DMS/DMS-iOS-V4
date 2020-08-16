//
//  ApplyAPI.swift
//  DMS_v4
//
//  Created by leedonggi on 2020/06/18.
//  Copyright © 2020 leedonggi. All rights reserved.
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
