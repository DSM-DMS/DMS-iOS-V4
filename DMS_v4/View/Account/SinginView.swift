//
//  SiginView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/09/26.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct SigninView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var id: String = ""
    @State private var pw: String = ""
    @State private var editingID = false
    @State private var editingPW = false
    @State private var sigingUp = false
    
    let aniDuration = 0.2
    
    var body: some View {
        VStack {
            HStack {
                Text("로그인")
                    .fontWeight(.bold)
                    .foregroundColor(Color("CustomGreen"))
                    .font(Font.system(size: 24))
                    .padding(.leading, 24)
                    .padding(.top, 80)
                Spacer()
            }
            VStack {
                HStack {
                    ZStack {
                        Image(systemName: "person")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color(ColorToUse.getColor(.Black700)()))
                            .animation(.easeInOut(duration: aniDuration))
                        Image(systemName: "person")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomGreen"))
                            .animation(.easeInOut(duration: aniDuration))
                            .opacity(editingID ? 1 : 0)
                    }
                    
                    TextField("아이디를 입력해주세요", text: $id)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color(ColorToUse.getColor(.Black700)()))
                }
                .padding(.horizontal, 32)
                .padding(.top, 40)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(editingID ? Color("CustomGreen") : Color(ColorToUse.getColor(.Black700)()))
                    .padding(.horizontal, 26)
                    .padding(.top, -4)
                    .animation(.easeInOut(duration: aniDuration))
                
                HStack {
                    ZStack {
                        Image(systemName: "lock")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color(ColorToUse.getColor(.Black700)()))
                            .animation(.easeInOut(duration: aniDuration))
                        Image(systemName: "lock")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("CustomGreen"))
                            .animation(.easeInOut(duration: aniDuration))
                            .opacity(editingPW ? 1: 0)
                    }
                    SecureField("비밀번호를 입력해주세요", text: $pw)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color(ColorToUse.getColor(.Black700)()))
                }
                .padding(.horizontal, 32)
                .padding(.top, 20)
                Rectangle()
                    .foregroundColor(editingPW ? Color("CustomGreen") : Color(ColorToUse.getColor(.Black700)()))
                    .frame(height: 1)
                    .padding(.horizontal, 26)
                    .padding(.top, -4)
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("checkbox_off")
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.black)
                    }
                    .padding(.leading, 24)
                    Text("자동 로그인")
                        .font(Font.system(size: 12))
                    Spacer()
                }
                .padding(.top, 12)
                
            }
            Spacer()
            Button("로그인") { self.postData() }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                .foregroundColor(Color.white)
                .background(Color("CustomGreen"))
                .cornerRadius(8)
                .padding(.bottom, 116)
                .padding(.horizontal, 24)
                .onTapGesture {
                    self.postData()
            }
            HStack {
                Text("아직 DMS 회원이 아니시라면?")
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                Button(action: {
                    self.sigingUp.toggle()
                }) {
                    Text("회원가입")
                    .foregroundColor(Color("CustomGreen"))
                    .font(Font.system(size: 12))
                }.sheet(isPresented: $sigingUp) {
                    SignupCollectView()
                }
                
                    
            }
            .padding(.bottom, 44)
        }
    }
}

extension SigninView {
    func postData() {
        _ = Connector.instance
            .getRequest(AuthAPI.signIn, method: .post, params: getParam())
            .decodeData(AuthModel.self)
            .subscribe(onNext: { [self] code, str, data in
                switch code{
                case 200: self.setData(data)
                case 204: print(code)
                default: print(code)
                }
            })
    }
    
    func setData(_ input: [String: Any]) {
        Token.instance.save(AuthModel(accessToken: input["accessToken"] as! String, refreshToken: (input["refreshToken"] as! String)))
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func getParam() -> [String : String] {
        var param = [String : String]()
        param["id"] = id
        param["password"] = pw
        return param
    }
}

struct SiginView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
