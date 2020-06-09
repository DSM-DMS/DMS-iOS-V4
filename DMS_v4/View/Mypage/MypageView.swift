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
    
    @State private var isFirst = mypageNum
    
    var body: some View {
        
        return VStack {
            GeometryReader { proxy in
                UIScrollViewWrapper {
                    HStack {
                        MyPageFirstView()
                            .frame(width: proxy.size.width - 8, height: proxy.size.height)
                        MypageSubView()
                            .frame(width: proxy.size.width - 8, height: proxy.size.height)                    }
                        .frame(width: proxy.size.width * 2, height: proxy.size.height)
                }
            }
            ZStack {
                HStack {
                    Rectangle()
                        .foregroundColor(Color(ColorToUse.getColor(.Black600)()))
                        .frame(width: 8, height: 8)
                        .cornerRadius(4)
                        .padding(.vertical, 20)
                    Rectangle()
                        .foregroundColor(Color(ColorToUse.getColor(.Black600)()))
                        .frame(width: 8, height: 8)
                        .cornerRadius(4)
                        .padding(.vertical, 20)
                }
                Rectangle()
                    .foregroundColor(Color("CustomGreen"))
                    .frame(width: 8, height: 8)
                    .cornerRadius(4)
                    .padding(.vertical, 20)
                    .offset(x: isFirst ? 8 : -8)
                    .animation(.easeInOut)
            }
        }
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
    var body: some View {
        VStack {
            Image("icon_mypage")
                .frame(width: 50, height: 50)
                .padding(.top, 24)
            Text("2학년 2반 11번 이동기")
                .padding(.top, 24)
            CardView(lblTitle: "귀가상태", lblCondition: "토요 귀가")
                .frame(minHeight: 0, maxHeight: .infinity)
            CardView2(lblTitle: ["상점", "벌점"], lblCondition: ["35", "7"])
                .frame(minHeight: 0, maxHeight: .infinity)
            CardView2(lblTitle: ["11시", "12시"], lblCondition: ["나온실", "3층 기숙사측"])
                .frame(minHeight: 0, maxHeight: .infinity)
            CardView2(lblTitle: ["토요일", "일요일"], lblCondition: ["신청", "미신청"])
                .frame(minHeight: 0, maxHeight: .infinity)
        }
        .padding(.bottom, 10)
    }
}
