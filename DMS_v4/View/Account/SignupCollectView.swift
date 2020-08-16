//
//  SignupCollectView.swift
//  DMS_v4
//
//  Created by leedonggi on 2020/06/17.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import SwiftUI

struct SignupCollectView: View {
    
    @State var goingNext = false
    @State var isConfirmed = false
    @State var txtID = ""
    @State var txtPW = ""
    @State var txtRPW = ""
    @State private var showToast = false
    @State private var isOnAppear = false
    @State private var toastTitle = ""
    @State private var toastDescription = ""
    
    var body: some View {
        ZStack {
            if showToast {
                ToasterView(isShowed: $showToast, toastTitle: toastTitle, toastDescription: toastDescription)
                .zIndex(1)
            }
            VStack {
                HStack {
                    SignupView(id: $txtID, pw: $txtPW, rpw: $txtRPW)
                        .frame(width: UIScreen.screenWidth)
                    ConfirmationView(isConfirmed: $isConfirmed)
                        .frame(width: UIScreen.screenWidth)
                }
                .offset(x: goingNext ? -UIScreen.screenWidth / 2: UIScreen.screenWidth / 2)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(Color("CustomGreen"))
                            .frame(width: 48, height: 48)
                            .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                            .opacity(isConfirmed ? 1:0)
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color.white)
                            .frame(width: 16, height: 16)
                            .opacity(isConfirmed ? 1:0)
                        Circle()
                            .foregroundColor(Color("CustomGreen"))
                            .frame(width: 48, height: 48)
                            .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                            .offset(x: isConfirmed ? -60:0)
                            .onTapGesture {
                                if self.goingNext {
                                    self.goingNext = false
                                    self.isConfirmed = false
                                } else {
                                    if self.txtID != "" && self.txtPW != "" && self.txtRPW != "" {
                                        self.goingNext = true
                                    } else {
                                        self.toastTitle = "다시 확인해주세요"
                                        self.toastDescription = "모든 값을 입력해주세요"
                                        self.showToast = true
                                    }
                                }
                            }
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color.white)
                            .frame(width: 16, height: 16)
                            .rotationEffect(goingNext ? .degrees(-180):.zero)
                            .offset(x: isConfirmed ? -60:0)
                    }
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
                    .opacity(isOnAppear ? 0 : 1)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                }
                .frame(width: UIScreen.screenWidth)
            }
        }
    }
}

struct SignupCollectView_Previews: PreviewProvider {
    static var previews: some View {
        SignupCollectView()
    }
}


