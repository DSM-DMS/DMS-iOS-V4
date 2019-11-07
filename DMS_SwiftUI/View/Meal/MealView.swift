//
//  MealView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/09/24.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI
import UIKit

struct MealView: View {
    
    var txtDate = "2019년 8월 31일 목요일"
    var date: Date!
    let formatter = DateFormatter()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "chevron.left")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.black)
                }
                Text(txtDate)
                    .foregroundColor(Color("CustomGreen"))
                    .font(Font.system(size: 18))
                    .fontWeight(.bold)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "chevron.right")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.black)
                }
            }
            MealContentsView()
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(.top, 20)
        }
        .padding(.vertical, 36)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}

