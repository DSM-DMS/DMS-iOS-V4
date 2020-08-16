//
//  ApplyMusicDetail.swift
//  DMS_v4
//
//  Created by leedonggi on 2020/08/13.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import SwiftUI


struct ApplyMusicDetailView: View {
    
    @State private var txtTitle = ""
    @State private var txtSinger = ""
    @State private var isApplying = false
    
    var dayName: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .frame(width: 16, height: 16)
                        .padding(.top, 28)
                        .padding(.leading, 28)
                        .onTapGesture {
                            self.isApplying = false
                    }
                    Spacer()
                }
                Spacer()
            }
            .offset(x: UIScreen.screenWidth / 2, y: isApplying ? 0: -300)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            VStack {
                Image("icon_music_big")
                    .padding(.top, 36)
                Text("\(dayName) 기상음악")
                    .fontWeight(.semibold)
                    .padding(.top, 8)
                    .padding(.bottom, 110)
                    .font(.system(size: 18))
                HStack {
                    MusicListView(isApplying: $isApplying)
                        .frame(width: UIScreen.screenWidth - 6)
                        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                    MusicApplyingView(txtTitle: $txtTitle, txtSinger: $txtSinger, isApplying: $isApplying, dayName: dayName)
                    .frame(width: UIScreen.screenWidth - 6)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                }
                .offset(x: isApplying ? -UIScreen.screenWidth / 2 : UIScreen.screenWidth / 2)
                BottomButton(buttonText: "신청")
                    .offset(y: isApplying ? 0:200)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                    .onTapGesture {
                        
                }
            }
        }
    }
}

struct ApplyMusicDetailViewPreview: PreviewProvider {
    static var previews: some View {
        ApplyMusicDetailView(dayName: "월요일")
    }
}

struct MusicApplyingView: View {
    @Binding var txtTitle: String
    @Binding var txtSinger: String
    @Binding var isApplying: Bool
    
    var dayName: String = ""
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "play.fill")
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("CustomText"))
                    TextField("노래 제목을 입력해주세요", text: $txtTitle)
                        .font(.system(size: 12))
                        .foregroundColor(Color("CustomText"))
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("CustomText"))
            }
            .padding(.horizontal, 24)
            VStack {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("CustomText"))
                    TextField("가수 이름을 입력해주세요", text: $txtSinger)
                        .font(.system(size: 12))
                        .foregroundColor(Color("CustomText"))
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("CustomText"))
            }
            .padding(.horizontal, 24)
            Spacer()
        }
    }
}

struct MusicListView: View {
    @Binding var isApplying: Bool
    
    var body: some View {
        Button("음악 리스트") {
            self.isApplying.toggle()
        }
    }
}
