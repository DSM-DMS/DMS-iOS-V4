//
//  ApplySundayRest.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/06/04.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplySundayRestView: View {
    var body: some View {
        VStack {
            Image("icon_rest_big")
                .padding(.top, 24)
            Text("휴식 신청")
                .font(.custom("NanumSquareB", size: 18))
                .padding(.top, 24)
            Text("일요일 자습 시간에 호실 휴식을 신청할 수 있습니다")
                .font(.custom("NanumSqureR", size: 14))
                .padding(.top, 24)
            RestCardView()
                .padding(.top, 50)
            RestCardView()
            .padding(.top, 16)
            Spacer()
        }
    }
}

struct ApplySundayRest_Previews: PreviewProvider {
    static var previews: some View {
        ApplySundayRestView()
    }
}

struct RestCardView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                .frame(height: 80)
                .padding(.horizontal, 24)
            VStack {
                Text("오전 자습 휴식")
                    .font(.custom("NanumSqureR", size: 16))
                Text("일요일 오전 자습 시간 때 호실 휴식을 합니다")
                    .font(.custom("NanumSqureL", size: 12))
                    .padding(.top, 6)
            }
        }
    }
}
