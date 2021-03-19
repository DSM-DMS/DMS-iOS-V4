//
//  ChangePWView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/22.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ChangePWView: View {
    @State private var original = ["", "", ""]
    @State private var editingOriginal = [false, false, false]
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Image("icon_change_big")
                        .padding(.bottom, 24)
                    Text("비밀번호 변경")
                        .font(Font.system(size: 18))
                        .fontWeight(.bold)
                        .padding(.bottom, 48)
                    TextView(original: $original[0], editingOriginal: $editingOriginal[0], beforeImage: "icon_password", afterImage: "icon_password_green", placeholder: "기존 비밀번호를 입력해주세요", selfNum: 0)
                    TextView(original: $original[1], editingOriginal: $editingOriginal[1], beforeImage: "icon_check", afterImage: "icon_check_green", placeholder: "변경할 비밀번호를 입력해주세요", selfNum: 1)
                    TextView(original: $original[2], editingOriginal: $editingOriginal[2], beforeImage: "icon_change_black", afterImage: "icon_change_green", placeholder: "변경할 비밀번호를 다시 입력해주세요", selfNum: 2)
                }
                BottomButton(buttonText: "변경")
            }
        }
    }
}

struct ChangePWView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePWView()
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
                SecureField(placeholder, text: $original, onCommit: {
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
                .animation(.easeInOut(duration: aniDuration))
            
        }
    }
}

struct BottomButton: View {
    var buttonText = ""
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(Color("CustomGreen"))
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 40)
                Button(buttonText) { }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    .foregroundColor(Color.white)
                    .background(Color("CustomGreen"))
            }
        }
    }
}
