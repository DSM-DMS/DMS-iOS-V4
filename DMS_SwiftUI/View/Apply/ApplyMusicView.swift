//
//  ApplyGoingOutView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/27.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyMusicView: View {
    @State private var original = ["", ""]
    @State private var editingOriginal = [false, false]
    
    var body: some View {
        VStack {
            Image("icon_stay_big")
                .padding(.top, 36)
                .padding(.bottom, 4)
            Text("월요일 기상음악")
                .fontWeight(.bold)
                .font(Font.system(size: 18))
                .padding(.bottom, 114)
            TextView(original: $original[0], editingOriginal: $editingOriginal[0], beforeImage: "icon_password", afterImage: "icon_password_green", placeholder: "노래 제목을 입력해주세요", selfNum: 0)
            TextView(original: $original[1], editingOriginal: $editingOriginal[1], beforeImage: "icon_password", afterImage: "icon_password_green", placeholder: "아티스트를 입력해주세요", selfNum: 0)
            Spacer()
            ButtomButton(buttonText: "신청")
        }
    }
}

struct ApplyMusicView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyMusicView()
    }
}

private struct TextView: View {
    @Binding var original: String
    @Binding var editingOriginal: Bool
    
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
                        .foregroundColor(Color(ColorToUse.getColor(.Black700)()))
                        .animation(.easeInOut(duration: aniDuration))
                    Image(afterImage)
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("CustomGreen"))
                        .animation(.easeInOut(duration: aniDuration))
                        .opacity(editingOriginal ? 1 : 0)
                }
                .padding(.trailing, 8)
                
                TextField(placeholder, text: $original, onCommit: {
                    print("commited")
                })
                    .font(Font.system(size: 12))
                    .foregroundColor(Color(ColorToUse.getColor(.Black700)()))
            }
            .padding(.horizontal, 32)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(editingOriginal ? Color("CustomGreen") : Color(ColorToUse.getColor(.Black700)()))
                .padding(.horizontal, 26)
                .padding(.top, -4)
                .padding(.bottom, 36)
                .animation(.easeInOut(duration: aniDuration))        }
    }
}
