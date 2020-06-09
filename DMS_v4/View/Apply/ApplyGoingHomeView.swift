//
//  ApplyGoingHomeView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/27.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyGoingHomeView: View {
    var body: some View {
        VStack {
            Image("icon_stay_big")
                .padding(.top, 24)
                .padding(.bottom, 16)
            Text("귀가 신청")
                .fontWeight(.bold)
                .font(Font.system(size: 18))
                .padding(.bottom, 8)
            Text("""
금요일 밤부터 일요일 밤까지의 상태를 선택합니다
목요일 오후 10시까지 잔류 신청을 완료해야 합니다
""")
                .fontWeight(.regular)
                .font(Font.system(size: 14))
                .multilineTextAlignment(.center)
                .lineLimit(2)
            VStack {
                CardView(description: "금요귀가", details: "금요일 일과 후 귀가합니다")
                    .frame(minHeight: 0, maxHeight: .infinity)
                CardView(description: "토요귀가", details: "토요일 취침 점호 전까지 귀가합니다")
                    .frame(minHeight: 0, maxHeight: .infinity)
                CardView(description: "토요귀사", details: "금요귀가 후 토요일 취침 점호 전까지 귀사합니다")
                    .frame(minHeight: 0, maxHeight: .infinity)
                CardView(description: "잔류", details: "기숙사에 잔류합니다")
                    .frame(minHeight: 0, maxHeight: .infinity)
            }
            .frame(minHeight: 0, maxHeight: .infinity)
            .padding(.horizontal, 24)
            .padding(.top, 8)
        }
        .padding(.bottom, 24)
    }
}

struct ApplyGoingHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyGoingHomeView()
    }
}

private struct CardView: View {
    var description = "금요귀가"
    var details = "금요일 일과 후 귀가합니다"
    
    var body: some View {
        return HStack {
            HStack {
                VStack {
                    Text(description)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.bottom, 2)
                    Text(details)
                        .font(Font.system(size: 12))
                        .fontWeight(.light)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.top, 16)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}
