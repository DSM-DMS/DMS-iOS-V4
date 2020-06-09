//
//  MealView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/09/24.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI
import RxSwift

struct MealView: View {
    
    var txtDate = "2019년 8월 31일 목요일"
    @State var mealDate = Date()
    let formatter = DateFormatter()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.mealDate = self.mealDate.addingTimeInterval(-60 * 60 * 24)
                    self.getData()
                }) {
                    Image(systemName: "chevron.left")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("CustomBlack"))
                }
                Text(getTextFromDate(date: mealDate))
                    .foregroundColor(Color("CustomGreen"))
                    .font(Font.system(size: 18))
                    .fontWeight(.bold)
                Button(action: {
                    self.mealDate = self.mealDate.addingTimeInterval(60 * 60 * 24)
                    self.getData()
                }) {
                    Image(systemName: "chevron.right")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("CustomBlack"))
                }
            }
            MealContentsView()
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(.top, 20)
        }
        .padding(.vertical, 36)
    }
    
    func getData(){
        _ = Connector.instance
                .getRequest(MealAPI.getMealInfo(date: getDateStr()), method: .get)
                .decodeData(MealModel.self)
                .subscribe(onNext: { [self] code, data in
                    switch code{
                    case 200: print(data)
                    case 204: print(code)
                    default: print(code)
                    }
                })
    }
    
    private func getDateStr() -> String{
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: mealDate)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
