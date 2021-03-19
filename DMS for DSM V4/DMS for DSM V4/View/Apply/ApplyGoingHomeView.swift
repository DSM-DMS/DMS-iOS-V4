//
//  ApplyGoingHomeView.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

struct ApplyGoingHomeView: View {
    
    @State private var isTapped = [false, false, false, false]
    @State private var showToast = false
    @State private var currentCondition = 0
    @State private var toastTitle = ""
    @State private var toastDescription = ""
    
    var body: some View {
        ZStack {
            if showToast {
                ToasterView(isShowed: $showToast, toastTitle: toastTitle, toastDescription: toastDescription)
                    .zIndex(1)
            }
            VStack {
                Image("icon_stay_big")
                    .padding(.top, 24)
                    .padding(.bottom, 16)
                Text("귀가 신청")
                    .fontWeight(.bold)
                    .font(Font.system(size: 18))
                    .padding(.bottom, 8)
                Text("""
    금요일 밤부터 일요일 밤까지의 상태를 선택합니다
    목요일 오후 10시까지 잔류 신청을 완료해야 합니다
    """)
                    .fontWeight(.regular)
                    .font(Font.system(size: 14))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                VStack {
                    CardView(description: "금요귀가", details: "금요일 일과 후 귀가합니다", changingColor: $isTapped[0])
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .onTapGesture {
                            self.currentCondition = 0
                            self.postData()
                            withAnimation {
                                self.isTapped[0] = true
                                for i in 1...3 { self.isTapped[i] = false }
                            }
                    }
                    CardView(description: "토요귀가", details: "토요일 취침 점호 전까지 귀가합니다", changingColor: $isTapped[1])
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .onTapGesture {
                            self.currentCondition = 1
                            self.postData()
                            withAnimation {
                                for i in 0...3 {
                                    if i == 1 { self.isTapped[1] = true }
                                    else { self.isTapped[i] = false }
                                }
                            }
                    }
                    CardView(description: "토요귀사", details: "금요귀가 후 토요일 취침 점호 전까지 귀사합니다", changingColor: $isTapped[2])
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .onTapGesture {
                            self.currentCondition = 2
                            self.postData()
                            withAnimation {
                                for i in 0...3 {
                                    if i == 2 { self.isTapped[2] = true }
                                    else { self.isTapped[i] = false }
                                }
                            }
                    }
                    CardView(description: "잔류", details: "기숙사에 잔류합니다", changingColor: $isTapped[3])
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .onTapGesture {
                            self.currentCondition = 3
                            self.postData()
                            withAnimation {
                                for i in 0...3 {
                                    if i == 3 { self.isTapped[3] = true }
                                    else { self.isTapped[i] = false }
                                }
                            }
                    }
                }
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(.horizontal, 24)
                .padding(.top, 8)
            }
            .padding(.bottom, 24)
        }
        .onAppear {
            self.getData()
        }
    }
    
    func getData() {
        _ = Connector.instance
            .getRequest(ApplyAPI.getGoingOut, method: .get)
            .decodeData(MealModel.self)
            .subscribe(onNext: { [self] code, str, data in
                switch code{
                case 200:
                    self.setData(data["value"] as! Int - 1)
                case 204: print(code)
                default: print(code)
                }
            })
    }
    
    func postData() {
        _ = Connector.instance
            .getRequest(ApplyAPI.getGoingOut, method: .post, params: ["value": currentCondition + 1])
            .decodeData(AuthModel.self)
            .subscribe(onNext: { [self] code, str, data in
                switch code{
                case 201:
                    self.toastTitle = "신청 성공"
                    self.toastDescription = self.getGoingHomeText()
                    self.showToast = true
                case 409:
                    self.toastTitle = "신청 실패"
                    self.toastDescription = "신청 가능한 시간이 아닙니다"
                    self.showToast = true
                case 403:
                    self.toastTitle = "권한 없음"
                    self.toastDescription = "로그인 기한이 만료됐습니다"
                    self.showToast = true
                case 401:
                    self.toastTitle = "권한 없음"
                    self.toastDescription = "로그인 기한이 만료됐습니다"
                    self.showToast = true
                default: print(code)
                }
            })
    }
    
    func setData(_ data: Int) {
        isTapped[data] = true
    }
    
    func getGoingHomeText() -> String {
        switch currentCondition {
        case 0:
            return "금요귀가 신청되었습니다"
        case 1:
            return "토요귀가 신청되었습니다"
        case 2:
            return "토요귀사 신청되었습니다"
        default:
            return "잔류 신청되었습니다"
        }
    }
}

struct ApplyGoingHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyGoingHomeView()
    }
}

private struct CardView: View {
    
    var description = "금요귀가"
    var details = "금요일 일과 후 귀가합니다"
    @Binding var changingColor: Bool
    
    var body: some View {
        return HStack {
            HStack {
                VStack {
                    Text(description)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(changingColor ? Color.white : Color("CustomBlack"))
                        .padding(.bottom, 2)
                    Text(details)
                        .font(Font.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(changingColor ? Color.white : Color("CustomBlack"))
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(changingColor ? Color("CustomGreen") : Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.top, 16)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}

enum ClassArray {
    case firstFloor
    case secondFloor
    case thirdFloor
    case fourthFloor
    case fifthFloor
    
    func getClass() -> [String] {
        switch self {
        case .firstFloor:
            return ["가온실", "나온실", "다온실", "라온실"]
        case .secondFloor:
            return [""]
        case .thirdFloor:
            return [""]
        case .fourthFloor:
            return [""]
        case .fifthFloor:
            return [""]
        }
    }
}

