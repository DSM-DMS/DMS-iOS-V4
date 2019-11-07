//
//  Color.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/09/24.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

enum GradientColor {
    case basic
    
    func getColor() -> LinearGradient {
        switch self {
        case .basic:
            return LinearGradient(gradient: Gradient(colors: [Color("CustomGreen"), Color(ColorToUse.getColor(.Green500)())]), startPoint: .leading, endPoint: .trailing)
        }
    }
}
enum ColorToUse{
    
    case Green100, Green200, Green300, Green400, Green500, Green600, Green700, Green800, Green900
    case Black100, Black200, Black300, Black400, Black500, Black600, Black700, Black800, Black900
    
    func getColor() -> UIColor {
        switch self {
        case .Green100:
            return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case .Green200:
            return UIColor(red: 204/255, green: 242/255, blue: 233/255, alpha: 1)
        case .Green300:
            return UIColor(red: 178/255, green: 235/255, blue: 222/255, alpha: 1)
        case .Green400:
            return UIColor(red: 153/255, green: 229/255, blue: 211/255, alpha: 1)
        case .Green500:
            return UIColor(red: 127/255, green: 222/255, blue: 200/255, alpha: 1)
        case .Green600:
            return UIColor(red: 102/255, green: 216/255, blue: 189/255, alpha: 1)
        case .Green700:
            return UIColor(red: 76/255, green: 209/255, blue: 177/255, alpha: 1)
        case .Green800:
            return UIColor(red: 25/255, green: 196/255, blue: 155/255, alpha: 1)
        case .Green900:
            return UIColor(red: 0/255, green: 190/255, blue: 145/255, alpha: 1)
        case .Black100:
            return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case .Black200:
            return UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1)
        case .Black300:
            return UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1)
        case .Black400:
            return UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1)
        case .Black500:
            return UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        case .Black600:
            return UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1)
        case .Black700:
            return UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
        case .Black800:
            return UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        case .Black900:
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }
    
}
