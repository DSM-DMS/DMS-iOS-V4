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
    @State private var showToast = false
    @State private var isAgreedToAutoSignIn = false
    
    let aniDuration = 0.2
    
    var body: some View {
        ZStack {
            if showToast {
                ToasterView(isShowed: $showToast, toastTitle: "로그인 실패", toastDescription: "다시 확인해주세요")
                .zIndex(1)
            }
            VStack {
                HStack {
                    Text("로그인")
                        .fontWeight(.bold)
                        .foregroundColor(Color("CustomGreen"))
                        .font(Font.system(size: 24))
                        .padding(.leading, 24)
                        .padding(.top, 80)
                        .keyboardType(.emailAddress)
                    Spacer()
                }
                VStack {
                    HStack {
                        ZStack {
                            Image(systemName: "person")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("CustomText"))
                                .animation(.easeInOut(duration: aniDuration))
                            Image(systemName: "person")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("CustomGreen"))
                                .animation(.easeInOut(duration: aniDuration))
                                .opacity(editingID ? 1 : 0)
                        }
                        
                        TextField("아이디를 입력해주세요", text: $id)
                            .font(Font.system(size: 12))
                            .foregroundColor(Color("CustomText"))
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 40)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(editingID ? Color("CustomGreen") : Color("CustomText"))
                        .padding(.horizontal, 26)
                        .padding(.top, -4)
                        .animation(.easeInOut(duration: aniDuration))
                    
                    HStack {
                        ZStack {
                            Image(systemName: "lock")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("CustomText"))
                                .animation(.easeInOut(duration: aniDuration))
                            Image(systemName: "lock")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("CustomGreen"))
                                .animation(.easeInOut(duration: aniDuration))
                                .opacity(editingPW ? 1: 0)
                        }
                        SecureField("비밀번호를 입력해주세요", text: $pw)
                            .font(Font.system(size: 12))
                            .foregroundColor(Color("CustomText"))
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 20)
                    Rectangle()
                        .foregroundColor(editingPW ? Color("CustomGreen") : Color("CustomText"))
                        .frame(height: 1)
                        .padding(.horizontal, 26)
                        .padding(.top, -4)
                    HStack {
                        Button(action: {self.isAgreedToAutoSignIn.toggle()}) {
                            if self.isAgreedToAutoSignIn {
                                Image("checkbox_on")
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("CustomGreen"))
                            } else {
                                Image("checkbox_off")
                                .frame(width: 24, height: 24)
                                    .foregroundColor(Color("CustomBlack"))
                            }
                        }
                        .padding(.leading, 24)
                        Text("ID/PW 저장")
                            .font(Font.system(size: 12))
                        Spacer()
                    }
                    .padding(.top, 12)
                    
                }
                Spacer()
                Button("로그인") {
                    if self.id != "" && self.pw != "" {
                        if self.isAgreedToAutoSignIn {
                            Account.instance.save(self.id, self.pw)
                        }
                        self.postData()
                    } else {
                        self.showToast = true
                    }
                }
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
        .onAppear {
            self.isAgreedToAutoSignIn = Account.instance.getAgreement()
            if self.isAgreedToAutoSignIn {
                let account = Account.instance.get()
                self.id = account[0]!
                self.pw = account[1]!
            }
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
                case 204: self.showToast = true
                default: print(code)
                }
            })
    }
    
    func setData(_ input: [String: Any]) {
        if self.isAgreedToAutoSignIn {
            Account.instance.agreeAutoSignIn(self.isAgreedToAutoSignIn)
            Account.instance.save(id, pw)
        } else {
            Account.instance.agreeAutoSignIn(self.isAgreedToAutoSignIn)
        }
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
