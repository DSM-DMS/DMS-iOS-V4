//
//  ApplyGoingHomeView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/27.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyGoingHomeView: View {
    
    @State private var degrees = [0.0, 0.0, 0.0, 0.0]
    @State private var isTapped = [false, false, false, false]
    
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
                CardView(description: "금요귀가", details: "금요일 일과 후 귀가합니다", changingColor: $isTapped[0])
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation {
                            self.degrees[0] += 360
                            self.isTapped[0] = true
                            for i in 1...3 { self.isTapped[i] = false }
                        }
                }
                .rotation3DEffect(.degrees(degrees[0]), axis: (x: 1, y: 0, z: 0))
                CardView(description: "토요귀가", details: "토요일 취침 점호 전까지 귀가합니다", changingColor: $isTapped[1])
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation {
                            self.degrees[1] += 360
                            for i in 0...3 {
                                if i == 1 { self.isTapped[1] = true }
                                else { self.isTapped[i] = false }
                            }
                        }
                }
                .rotation3DEffect(.degrees(degrees[1]), axis: (x: 1, y: 0, z: 0))
                CardView(description: "토요귀사", details: "금요귀가 후 토요일 취침 점호 전까지 귀사합니다", changingColor: $isTapped[2])
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation {
                            self.degrees[2] += 360
                            for i in 0...3 {
                                if i == 2 { self.isTapped[2] = true }
                                else { self.isTapped[i] = false }
                            }
                        }
                }
                .rotation3DEffect(.degrees(degrees[2]), axis: (x: 1, y: 0, z: 0))
                CardView(description: "잔류", details: "기숙사에 잔류합니다", changingColor: $isTapped[3])
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation {
                            self.degrees[3] += 360
                            for i in 0...3 {
                                if i == 3 { self.isTapped[3] = true }
                                else { self.isTapped[i] = false }
                            }
                        }
                }
                .rotation3DEffect(.degrees(degrees[3]), axis: (x: 1, y: 0, z: 0))
            }
            .frame(minHeight: 0, maxHeight: .infinity)
            .padding(.horizontal, 24)
            .padding(.top, 8)
        }
        .padding(.bottom, 24)
    }
    
    func getData() {
        
    }
    
    func postData() {
        
    }
    
    func setData() {
        
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
    @Binding var changingColor: Bool
    
    var body: some View {
        return HStack {
            HStack {
                VStack {
                    Text(description)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(changingColor ? Color.white : Color("CustomBlack"))
                        .padding(.bottom, 2)
                    Text(details)
                        .font(Font.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(changingColor ? Color.white : Color("CustomBlack"))
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(changingColor ? Color("CustomGreen") : Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.top, 16)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}
