//
//  MealModel.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import Foundation

public typealias MealTuple = (breakfast: String, lunch: String, dinner: String)

public struct MealModel: Codable{
    
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
    
    func getData() -> MealTuple{
        return (getStr(breakfast), getStr(lunch), getStr(dinner))
    }
    
    func getDataForExtension() -> [String]{
        return [getStr(breakfast), getStr(lunch), getStr(dinner)]
    }
    
    private func getStr(_ arr: [String]) -> String{
        var data = arr.map{ $0 + ", " }.reduce(""){ $0 + $1 }
        data.removeLast(2)
        return data
    }
    
}
