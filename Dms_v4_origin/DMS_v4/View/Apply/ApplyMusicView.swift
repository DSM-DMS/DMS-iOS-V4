//
//  ApplyGoingOutView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/27.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyMusicView: View {
    @State private var numOfBookedMusic = [0, 0, 0, 0, 0]
    @State private var isTapped = [false, false, false, false, false]
    @State private var editingOriginal = [false, false]
    
    var body: some View {
        VStack {
            Image("icon_stay_big")
                .padding(.top, 36)
                .padding(.bottom, 4)
            Text("기상음악 신청")
                .fontWeight(.bold)
                .font(Font.system(size: 18))
            Text("""
기상 음악을 신청할 수 있습니다.
요일 별로 신청 가능하며 상시 신청 가능합니다.
""")
                .frame(height: 34)
                .multilineTextAlignment(.center)
                .font(Font.system(size: 14))
                .lineLimit(2)
                .padding(.top, 24)
                .padding(.bottom, 36)
            ButtonView(dayName: "월요일", numOfMusic: "0")
                .onTapGesture {
                        self.isTapped[0] = true
                }
                .sheet(isPresented: $isTapped[0]) {
                    ApplyMusicDetailView(dayName: "월요일")
                }
            ButtonView(dayName: "화요일", numOfMusic: "0")
            .onTapGesture {
                    self.isTapped[1] = true
            }
            .sheet(isPresented: $isTapped[1]) {
                ApplyMusicDetailView(dayName: "화요일")
            }
            ButtonView(dayName: "수요일", numOfMusic: "0")
            .onTapGesture {
                    self.isTapped[2] = true
            }
            .sheet(isPresented: $isTapped[2]) {
                ApplyMusicDetailView(dayName: "수요일")
            }
            ButtonView(dayName: "목요일", numOfMusic: "0")
            .onTapGesture {
                    self.isTapped[3] = true
            }
            .sheet(isPresented: $isTapped[3]) {
                ApplyMusicDetailView(dayName: "목요일")
            }
            ButtonView(dayName: "금요일", numOfMusic: "0")
            .onTapGesture {
                    self.isTapped[4] = true
            }
            .sheet(isPresented: $isTapped[4]) {
                ApplyMusicDetailView(dayName: "금요일")
            }
            Spacer()
        }
    }
}

struct ApplyMusicView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyMusicView()
    }
}

private struct ButtonView: View {
    
    var dayName: String = ""
    var numOfMusic: String = ""
    
    var body: some View {
        return ZStack {
            Text(dayName)
                .font(Font.system(size: 16))
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("icon_musiclist")
                    Text(numOfMusic)
                        .font(Font.system(size: 12))
                }
                .padding(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/, 8)
                .padding(.bottom, 9)
            }
        }
        .background(Color("CustomWhite"))
    .cornerRadius(12)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
        .padding(.horizontal, 24)
    }
}
