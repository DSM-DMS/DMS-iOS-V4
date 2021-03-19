//
//  AuthAPI.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
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
