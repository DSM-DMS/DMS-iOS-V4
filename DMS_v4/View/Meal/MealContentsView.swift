//
//  MealContentsView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/13.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct MealContentsView: View {
    
    var body: some View {
        VStack {
            CardView(lblTitle: "아침", lblCondition: "급식이 없습니다")
            CardView(lblTitle: "점심", lblCondition: "허니버터옥수수, 강황쌀밥, 돼지갈비김치찌개, 애호박새우젓볶음, 오이소박이, 깐쇼새우")
            CardView(lblTitle: "저녁", lblCondition: "허니버터옥수수, 강황쌀밥, 돼지갈비김치찌개, 애호박새우젓볶음, 오이소박이, 깐쇼새우")
        }
    }
}

private struct CardView: View {
    var lblTitle = "아침"
    var lblCondition = "허니버터옥수수, 강황쌀밥, 돼지갈비김치찌개, 애호박새우젓볶음, 오이소박이, 깐쇼새우"
    var body: some View {
        return  HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(lblTitle)
                        .font(Font.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color("CustomBlack"))
                    Spacer()
                        .frame(height: 16)
                    Text(lblCondition)
                        .font(Font.system(size: 12))
                        .fontWeight(.regular)
                        .lineLimit(nil)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .topLeading)
                        .padding(.top, 0)
                        .foregroundColor(Color("CustomBlack"))
                }
                .padding(.horizontal, 16)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.horizontal, 24)
        .padding(.top, 28)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}

struct MealContentsView_Previews: PreviewProvider {
    static var previews: some View {
        MealContentsView()
    }
}