//
//  SignupView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/09/29.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    @State private var editingID = false
    @State private var editingPW = false
    @State private var editingRPW = false
    
    @Binding var id: String
    @Binding var pw: String
    @Binding var rpw: String
    
    let aniDuration = 0.2
    
    var body: some View {
        VStack {
            HStack {
                Text("계정 정보 입력")
                    .fontWeight(.bold)
                    .foregroundColor(Color("CustomGreen"))
                    .font(Font.system(size: 24))
                    .padding(.leading, 24)
                    .padding(.top, 60)
                Spacer()
            }
            VStack {
                HStack {
                    ZStack {
                        Image(systemName: "person")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomText"))
                        Image(systemName: "person")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomGreen"))
                            .opacity(editingID ? 1 : 0)
                    }
                    
                    TextField("아이디를 입력해주세요", text: $id)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color("CustomText"))
                }
                .padding(.horizontal, 32)
                .padding(.top, 60)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(editingID ? Color("CustomGreen") : Color("CustomText"))
                    .padding(.horizontal, 26)
                    .padding(.top, -4)
                
                HStack {
                    ZStack {
                        Image(systemName: "lock")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomText"))
                        Image(systemName: "lock")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomGreen"))
                            .opacity(editingPW ? 1: 0)
                    }
                    SecureField("비밀번호를 입력해주세요", text: $pw)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color("CustomText"))
                }
                .padding(.horizontal, 32)
                .padding(.top, 36)
                Rectangle()
                    .foregroundColor(editingPW ? Color("CustomGreen") : Color("CustomText"))
                    .frame(height: 1)
                    .padding(.horizontal, 26)
                    .padding(.top, -4)
                
                HStack {
                    ZStack {
                        Image(systemName: "checkmark")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomText"))
                        Image(systemName: "checkmark")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomGreen"))
                            .opacity(editingRPW ? 1: 0)
                    }
                    SecureField("비밀번호를 다시 입력해주세요", text: $rpw)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color("CustomText"))
                }
                .padding(.horizontal, 32)
                .padding(.top, 36)
                Rectangle()
                    .foregroundColor(editingRPW ? Color("CustomGreen") : Color("CustomText"))
                    .frame(height: 1)
                    .padding(.horizontal, 26)
                    .padding(.top, -4)
                
            }
            Spacer()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(id: .constant(""), pw: .constant(""), rpw: .constant(""))
    }
}
