//
//  Connector.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/03/10.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

public class Connector {
    
    public static let instance = Connector()
       
    private let basePath = "https://api.dsm-dms.com/"
    private init(){ }
    
    func getRequest(_ subPath: API, method: RequestMethod, params: [String : Any]? = nil) -> URLRequest{
        var urlStr = basePath + subPath.getPath()
        
        if method == .get{
            var query = params?.map{ "\($0)=\($1)" }.reduce(""){ f, s -> String in "\(f)&\(s)" } ?? ""
            if !query.isEmpty{ query.removeFirst(); urlStr += ("?" + query) }
        }
        
        var request = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = method.rawValue
        
        if method != .get, params != nil{
            let jsonData = try? JSONSerialization.data(withJSONObject: params!)
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        if let token = Token.instance.get() {
            request.addValue(token.accessToken, forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
}

public extension URLRequest{
    
    mutating func setRefreshToken() -> URLRequest{
        guard let refreshToken = Token.instance.get()?.refreshToken else { return self }
        self.setValue(refreshToken, forHTTPHeaderField: "Authorization")
        return self
    }
    
    func decodeData<T>(_ type: T.Type) -> Observable<(Int, T?)> where T: Decodable{
        return requestData(self)
            .single()
            .map{ ($0.0.statusCode, $0.1) }
            .map{ (code, data) in
                let decodeData = try? JSONDecoder().decode(type, from: data)
                return (code, decodeData)
            }
            .filter{ (code, _) in
                if code == 500{ print("오류") }
                return code != 500
            }
    }
    
}

public enum RequestMethod: String{
    
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    
}
