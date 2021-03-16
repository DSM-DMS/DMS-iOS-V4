//
//  AuthAPI.swift
//  DMS_v4
//
//  Created by leedonggi on 2020/06/15.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import Foundation

public enum AuthAPI: API {
    case refreshAccessToken
    case signIn
    case signUp
    case changePassWord
    
    func getPath() -> String {
        switch self {
        case .refreshAccessToken: return "jwt/refresh"
        case .signIn: return "account/auth"
        case .signUp: return "account/signup"
        case .changePassWord: return "student/account/change-pw"
        }
    }
}
