//
//  MypageSubView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/14.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct MypageSubView: View {
    
    @State var isTapped = [false, false, false, false, false]
    
    @Binding var isLoggedOut: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("기타")
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color("CustomGreen"))
                    .padding(.top, 32)
                    .onAppear() {
                        for i in 0...4 {
                            self.isTapped[i] = false
                        }
                }
                BackgroundView(image: "icon_change", description: "비밀번호 변경", details: "현재 계정의 비밀번호를 변경합니다.")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        self.isTapped[0] = true
                }
                .sheet(isPresented: $isTapped[0]) {
                    ChangePWView()
                }
                BackgroundView(image: "icon_bugreport", description: "버그 신고", details: "DMS 사용 중에 발견된 버그를 신고합니다.")
                    .frame(minHeight: 0, maxHeight: .infinity)
                BackgroundView(image: "icon_point", description: "상벌점 내역", details: "상벌점 내역을 확인합니다.")
                    .frame(minHeight: 0, maxHeight: .infinity)
                BackgroundView(image: "icon_logout", description: "로그아웃", details: "현재 계정에서 로그아웃을 합니다")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                            self.isTapped[3] = true
                    }
                    .sheet(isPresented: $isTapped[3]) {
                        SigninView()
                    }
                BackgroundView(image: "icon_notification", description: "공지사항", details: "기숙사의 공지사항을 확인합니다.")
                    .frame(minHeight: 0, maxHeight: .infinity)
            }
            .padding(.horizontal,24)
            .padding(.bottom, 10)
        }
    }
}

struct MypageSubView_Previews: PreviewProvider {
    static var previews: some View {
        MypageSubView(isLoggedOut: .constant(false))
    }
}

struct BackgroundView: View {
    var image = "icon_change"
    var description = "비밀번호 변경"
    var details = "현재 계정의 비밀번호를 변경합니다."
    var backgroundColor: Color = Color.black
    var textColor: Color = Color.black
    
    var body: some View {
        return HStack {
            HStack {
                Image(image)
                    .frame(width: 36, height: 36)
                    .foregroundColor(Color("CustomGreen"))
                    .padding(.leading, 20)
                VStack(alignment: .leading) {
                    Text(description)
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .padding(.bottom, 4)
                    Text(details)
                        .font(Font.system(size: 10))
                        .fontWeight(.regular)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 20)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.top, 16)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}
