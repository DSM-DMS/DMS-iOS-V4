//
//  ApplyGoingOutView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/27.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyGoingOutView: View {
    
    var dateToGoout: String = ""
    var timeToGoout: String = ""
    var locationToGoout: String = ""
    
    var body: some View {
        VStack {
            Image("icon_outdoor_big")
                .padding(.top, 36)
                .padding(.bottom, 4)
            Text("외출 신청")
                .fontWeight(.bold)
                .font(Font.system(size: 18))
                .padding(.bottom, 20)
                .frame(width: 80)
            Text("주말 외출 및 평일 외출을 신청할 수 있습니다.")
                .fontWeight(.light)
                .font(Font.system(size: 14))
                .padding(.bottom, 56)
            TextView(beforeImage: "icon_date", afterImage: "icon_date_green", placeholder: "2019년 8월 11일 토요일")
            TextView(beforeImage: "icon_time", afterImage: "icon_time_green", placeholder: "PM 12 : 30 ~ PM 20 : 30", selfNum: 0)
            TextView(beforeImage: "icon_place", afterImage: "icon_place_green", placeholder: "행선지를 입력해주세요", selfNum: 0)
            Spacer()
            ButtomButton(buttonText: "신청")
        }
    }
}

struct ApplyGoingOutView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyGoingOutView()
    }
}

private struct TextView: View {
    let aniDuration = 0.2
    
    var beforeImage = ""
    var afterImage = ""
    var placeholder = ""
    var selfNum = 0
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(beforeImage)
                        .frame(width: 16, height: 16)
                        .animation(.easeInOut(duration: aniDuration))
                    Image(afterImage)
                        .frame(width: 16, height: 16)
                        .animation(.easeInOut(duration: aniDuration))
                }
                .padding(.trailing, 8)
                
                Text(placeholder)
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                Spacer()
            }
            .padding(.horizontal, 32)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("CustomGreen"))
                .padding(.horizontal, 26)
                .padding(.top, -4)
                .padding(.bottom, 36)
                .animation(.easeInOut(duration: aniDuration))        }
    }
}
