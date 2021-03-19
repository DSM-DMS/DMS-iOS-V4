//
//  ApplyView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/09/24.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyView: View {
    
    @GestureState var isTap = [false, false, false, false, false]
    @State var isTapped = [false, false, false, false, false]
    
    var body: some View {
        VStack {
            HStack {
                Text("신청")
                    .font(.title)
                    .foregroundColor(Color("CustomGreen"))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 24)
            CardView(image: "icon_stay", lblTitle: "귀가 신청", lblCondition: "금요일부터 일요일까지의 상태를 신청합니다")
            .onTapGesture {
                    self.isTapped[0] = true
            }
                
            .sheet(isPresented: $isTapped[0]) {
                ApplyGoingHomeView()
            }
            CardView(image: "icon_computer", lblTitle: "연장 신청", lblCondition: "기숙사에서 연장학습을 신청합니다")
                .onTapGesture {
                    self.isTapped[1] = true
            }
            .sheet(isPresented: $isTapped[1]) {
                ApplyExtensionView()
            }
            CardView(image: "icon_outdoor", lblTitle: "외출 신청", lblCondition: "외출 신청서를 작성하여 외출을 신청합니다")
                .onTapGesture {
                    self.isTapped[2] = true
            }
            .sheet(isPresented: $isTapped[2]) {
                ApplyGoingOutView()
            }
            CardView(image: "icon_music", lblTitle: "기상음악 신청", lblCondition: "아침 점호를 알리는 기상음악을 신청합니다")
                .onTapGesture {
                    self.isTapped[3] = true
            }
            .sheet(isPresented: $isTapped[3]) {
                ApplyMusicView()
            }
//            CardView(image: "icon_rest", lblTitle: "휴식 신청", lblCondition: "일요일 호실 휴식을 신청합니다")
//                .onTapGesture {
//                    self.isTapped[4] = true
//            }
//            .sheet(isPresented: $isTapped[4]) {
//                ApplySundayRestView()
//            }
        }
        .padding(.top, 36)
        .padding(.bottom, 24)
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView()
    }
}

private struct CardView: View {
    var image = "music.note"
    var lblTitle = "귀가 신청"
    var lblCondition = "금요일부터 일요일까지의 상태를 신청합니다"
    var body: some View {
        return  HStack {
            HStack {
                Image("\(image)")
                VStack(alignment: .leading) {
                    Text(lblTitle)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.bottom, 0)
                        .foregroundColor(Color("CustomBlack"))
                    Text(lblCondition)
                        .font(.system(size: 12))
                        .fontWeight(.thin)
                        .frame(width: 210, alignment: .leading)
                        .foregroundColor(Color("CustomBlack"))
                }
                .padding(.leading, 20)
                
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 2)
    }
}
