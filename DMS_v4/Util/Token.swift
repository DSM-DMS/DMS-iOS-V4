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
        if let at = accessToken, refreshToken != nil{ return AuthModel(accessToken: "Bearer " + at, refreshToken: "Bearer " + refreshToken!) }
        else{ return nil }
    }
    
}

struct AuthModel: Codable{
    let accessToken: String
    let refreshToken: String?
}

class Account {
    static let instance = Account()
    private let repo = UserDefaults.standard
    private let ID = "ID"
    private let PW = "PW"
    private let autoSignIn = "Auto"
    
    private init(){}
    
    func agreeAutoSignIn(_ auto: Bool) {
        repo.set(auto, forKey: autoSignIn)
    }
    
    func getAgreement() -> Bool {
        return repo.bool(forKey: autoSignIn)
    }
    
    func save(_ id: String, _ pw: String) {
        repo.set(id, forKey: ID)
        repo.set(pw, forKey: PW)
    }
    
    func get() -> [String?] {
        let id = repo.string(forKey: ID)
        let pw = repo.string(forKey: PW)
        if let identifier = id, pw != nil {
            return [identifier, pw]
        } else {
            return ["", ""]
        }
    }
}
