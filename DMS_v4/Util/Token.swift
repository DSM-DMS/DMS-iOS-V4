//
//  Token.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/03/10.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import Foundation

class Token{
    
    static let instance = Token()
    private let repo = UserDefaults.standard
    private let accessKey = "access"
    private let refreshKey = "refresh"
    
    private init(){}
    
    func save(_ token: AuthModel){
        repo.set(token.accessToken, forKey: accessKey)
        repo.set(token.refreshToken!, forKey: refreshKey)
    }
    
    func changeAccessToken(_ token: String){
        repo.set(token, forKey: accessKey)
    }
    
    func remove(){
        repo.removeObject(forKey: accessKey)
        repo.removeObject(forKey: refreshKey)
    }
    
    func get() -> AuthModel?{
        let accessToken = repo.string(forKey: accessKey)
        let refreshToken = repo.string(forKey: refreshKey)
        if let at = accessToken, refreshToken != nil{ return AuthModel(accessToken: "JWT " + at, refreshToken: "JWT " + refreshToken!) }
        else{ return nil }
    }
    
}

struct AuthModel: Codable{
    let accessToken: String
    let refreshToken: String?
}
