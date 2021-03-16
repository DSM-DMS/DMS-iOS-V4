//
//  MypageView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/09/24.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI
import Combine

struct MypageView: View {
    
    @State var isPaged = false
    @State var isLogouted = false
    @State var viewState = CGSize.zero
    @State private var studentID = "0학년 0반 00번"
    @State private var goingHomeCondition = ""
    @State private var studentPoints = [0, 0]
    @State private var extensionCondition = [String]()
    @State private var goingOutCondition = [Bool]()
    
    var body: some View {
        VStack {
            HStack {
                MyPageFirstView(studentID: self.$studentID, studentPoint: self.$studentPoints)
                    .frame(width: UIScreen.screenWidth - 6)
                MypageSubView(isLoggedOut: self.$isLogouted)
                    .frame(width: UIScreen.screenWidth - 6)
            }
            .offset(x: isPaged ? -UIScreen.screenWidth / 2 + viewState.width : UIScreen.screenWidth / 2 + viewState.width)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .gesture(
                DragGesture().onChanged{value in
                    self.viewState.width = value.translation.width
                }
                .onEnded { value in
                    if value.translation.width > UIScreen.screenWidth / 2 {
                        self.isPaged = false
                    } else if value.translation.width < -UIScreen.screenWidth / 2 {
                        self.isPaged = true
                    }
                    self.viewState.width = 0
                }
            )
            ZStack {
                HStack {
                    Rectangle()
                        .foregroundColor(Color(ColorToUse.getColor(.Black600)()))
                        .frame(width: isPaged ? 8 : 0, height: isPaged ? 8 : 0)
                        .cornerRadius(4)
                        .padding(.vertical, 20)
                        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                    Spacer()
                        .frame(width: 12)
                    Rectangle()
                        .foregroundColor(Color(ColorToUse.getColor(.Black600)()))
                        .frame(width: isPaged ? 0 : 8, height: isPaged ? 0 : 8)
                        .cornerRadius(4)
                        .padding(.vertical, 20)
                        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                }
                Rectangle()
                    .foregroundColor(Color("CustomGreen"))
                    .frame(width: 8, height: 8)
                    .cornerRadius(4)
                    .padding(.vertical, 20)
                    .offset(x: isPaged ? 8 : -8)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            }
        }
        .onAppear {
            self.getBasic()
        }
    }
}

extension MypageView {
    func getBasic() {
        _ = Connector.instance
            .getRequest(InfoAPI.getBasicInfo, method: .get)
            .decodeData(MypageModel.self)
            .subscribe(onNext: { [self] code, str, data in
                switch code{
                case 200:
                    print(data)
                    self.setData(data)
                case 204: print(code)
                default: print(code)
                }
            })
    }
    
    func getApply() {
        _ = Connector.instance
            .getRequest(InfoAPI.getApplyInfo, method: .get)
            .decodeData(MypageModel.self)
            .subscribe(onNext: { [self] code, str, data in
                switch code{
                case 200: print(data)
                case 204: print(data)
                default: print(code)
                }
            })
    }
    
    func setData(_ data: [String: Any]) {
        let number = data["number"] as! Int
        self.studentID = "\(number / 1000)학년 \((number % 1000) / 100)반 \(number % 100)번 \(data["name"] as! String)"
        self.studentPoints.removeAll()
        self.studentPoints.append(data["goodPoint"] as! Int)
        self.studentPoints.append(data["badPoint"] as! Int)
        self.getApply()
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}

private struct CardView: View {
    var lblTitle = "귀가 상태"
    var lblCondition = "토요 귀가"
    var body: some View {
        return  HStack {
            HStack {
                VStack {
                    Text(lblTitle)
                        .font(.system(size: 12))
                        .fontWeight(.thin)
                        .frame(width: 100)
                        .padding(.horizontal, 8)
                        .foregroundColor(Color("CustomBlack"))
                    Text(lblCondition)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("CustomBlack"))
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.horizontal, 24)
        .padding(.top, 28)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}

private struct CardView2: View {
    var lblTitle = [String]()
    var lblCondition = [String]()
    var body: some View {
        return  HStack {
            HStack {
                VStack {
                    Text(lblTitle[0])
                        .font(.system(size: 12))
                        .fontWeight(.thin)
                        .frame(width: 100)
                        .padding(.horizontal, 8)
                        .foregroundColor(Color("CustomBlack"))
                    Text(lblCondition[0])
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("CustomBlack"))
                }
                .padding(.leading, 36)
                Spacer()
                VStack {
                    Text(lblTitle[1])
                        .font(.system(size: 12))
                        .fontWeight(.thin)
                        .frame(width: 100)
                        .padding(.horizontal, 8)
                        .foregroundColor(Color("CustomBlack"))
                    Text(lblCondition[1])
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("CustomBlack"))
                    
                }
                .padding(.trailing, 36)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.horizontal, 24)
        .padding(.top, 28)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}

private struct MyPageFirstView: View {
    @Binding var studentID: String
    @Binding var studentPoint: [Int]
    
    var body: some View {
        VStack {
            Image("icon_mypage")
                .frame(width: 50, height: 50)
                .padding(.top, 24)
            Text("\(studentID)")
                .padding(.top, 24)
            CardView(lblTitle: "귀가상태", lblCondition: "잔류")
                .frame(minHeight: 0, maxHeight: .infinity)
            CardView2(lblTitle: ["상점", "벌점"], lblCondition: ["\(studentPoint[0])", "\(studentPoint[1])"])
                .frame(minHeight: 0, maxHeight: .infinity)
            CardView2(lblTitle: ["11시", "12시"], lblCondition: ["미신청", "미신청"])
                .frame(minHeight: 0, maxHeight: .infinity)
            CardView2(lblTitle: ["토요일", "일요일"], lblCondition: ["미신청", "미신청"])
                .frame(minHeight: 0, maxHeight: .infinity)
        }
        .padding(.bottom, 10)
    }
}
