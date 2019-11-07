//
//  ApplyGoingHomeView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/27.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyExtensionView: View {
    var body: some View {
        VStack {
            Image("icon_stay_big")
                .padding(.top, 24)
                .padding(.bottom, 16)
            Text("연장 신청")
                .fontWeight(.bold)
                .font(Font.system(size: 18))
                .padding(.bottom, 8)
            Text("""
기숙사로 이동 후 학생들은 연장학습을 할 수 있
습니다. 11시 연장은 8시 반까지, 12시 연장은
10시 반까지 신청할 수 있습니다.
""")
                .fontWeight(.regular)
                .font(Font.system(size: 14))
                .multilineTextAlignment(.center)
                .lineLimit(3)
            VStack {
                CardView(description: "1층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                CardView(description: "2층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                CardView(description: "3층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                CardView(description: "4층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                CardView(description: "5층")
                    .frame(minHeight: 0, maxHeight: .infinity)
            }
            .frame(minHeight: 0, maxHeight: .infinity)
            .padding(.horizontal, 24)
            .padding(.top, 8)
        }
    }
}

struct ApplyExtensionView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyExtensionView()
    }
}

private struct CardView: View {
    var description = "1층"
    
    var body: some View {
        return HStack {
            HStack {
                VStack {
                    Text(description)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.bottom, 2)
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
