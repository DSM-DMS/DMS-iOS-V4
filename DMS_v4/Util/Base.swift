//
//  Base.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/03/10.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import Foundation
import SwiftUI
import CryptoSwift

extension View {
    func getDate() -> String {
        let now = Date()
        let weekDay = DateFormatter()
        weekDay.locale = Locale(identifier: "ko_kr")
        weekDay.timeZone = TimeZone(abbreviation: "KST")
        weekDay.dateFormat = "EEEE"
        let monthEng = DateFormatter()
        monthEng.locale = Locale(identifier: "ko_kr")
        monthEng.timeZone = TimeZone(abbreviation: "KST")
        monthEng.dateFormat = "LLLL"
        let date = DateFormatter()
        date.locale = Locale(identifier: "ko_kr")
        date.timeZone = TimeZone(abbreviation: "KST")
        date.dateFormat = "dd yyyy HH:mm:ss"
        
        let kr = date.string(from: now)
        let returnValue = getMonthEng(monthEng.string(from: now)) + " " + getWeekday(weekDay.string(from: now)) + " " + kr
        return returnValue
    }
    
    func getCrypto() -> String {
        let date = getDate()
        let base64 = "iOS" + date
        let data = Data(base64.utf8).base64EncodedString()
        let crypto = data.sha3(.sha512)
        
        return crypto
    }
    
    func getToken() -> String {
        if let token = Token.instance.get() {
            return token.accessToken
        }
        return ""
    }
    
    func getWeekday(_ wd: String) -> String {
        switch wd {
        case "일요일":
            return "Sun"
        case "월요일":
            return "Mon"
        case "화요일":
            return "Tue"
        case "수요일":
            return "Wed"
        case "목요일":
            return "Thu"
        case "금요일":
            return "Fri"
        case "토요일":
            return "Sat"
        default:
            return "Error"
        }
    }
    
    func getMonthEng(_ me: String) -> String {
        switch me {
        case "1월":
            return "Jan"
        case "2월":
            return "Feb"
        case "3월":
            return "Mar"
        case "4월":
            return "Apr"
        case "5월":
            return "May"
        case "6월":
            return "Jun"
        case "7월":
            return "Jul"
        case "8월":
            return "Aug"
        case "9월":
            return "Sep"
        case "10월":
            return "Oct"
        case "11월":
            return "Nov"
        case "12월":
            return "Dec"
        default:
            return "Error"
            
        }
    }
    
    func getStr(_ arr: [String]) -> String{
        var data = arr.map{ $0 + ", " }.reduce(""){ $0 + $1 }
        data.removeLast(2)
        return data
    }
    
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
