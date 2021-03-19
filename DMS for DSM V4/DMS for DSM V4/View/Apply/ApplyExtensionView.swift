//
//  ApplyExtensionView.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

struct ApplyExtensionView: View {
    
    @State var isTapped: [Bool] = [false, false, false, false, false]
    
    var body: some View {
        VStack {
            Image("icon_stay_big")
                .padding(.top, 24)
                .padding(.bottom, 16)
            Text("연장 신청")
                .fontWeight(.bold)
                .font(Font.system(size: 18))
                .padding(.bottom, 8)
            Text("""
기숙사로 이동 후 학생들은 연장학습을 할 수 있
습니다. 11시 연장은 8시 반까지, 12시 연장은
10시 반까지 신청할 수 있습니다.
""")
                .fontWeight(.regular)
                .font(Font.system(size: 14))
                .multilineTextAlignment(.center)
                .lineLimit(3)
            VStack {
                CardView(description: "1층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isTapped[0].toggle()
                        }
                )
                    .sheet(isPresented: $isTapped[0]) {
                        ApplyExtensionDetailView(floor: 1)
                }
                CardView(description: "2층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isTapped[1].toggle()
                        }
                )
                    .sheet(isPresented: $isTapped[1]) {
                        ApplyExtensionDetailView(floor: 2)
                }
                CardView(description: "3층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isTapped[2].toggle()
                        }
                )
                    .sheet(isPresented: $isTapped[2]) {
                        ApplyExtensionDetailView(floor: 3)
                }
                CardView(description: "4층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isTapped[3].toggle()
                        }
                )
                    .sheet(isPresented: $isTapped[3]) {
                        ApplyExtensionDetailView(floor: 4)
                }
                CardView(description: "5층")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isTapped[4].toggle()
                        }
                )
                    .sheet(isPresented: $isTapped[4]) {
                        ApplyExtensionDetailView(floor: 5)
                }
            }
            .frame(minHeight: 0, maxHeight: .infinity)
            .padding(.horizontal, 24)
            .padding(.top, 8)
        }
        .padding(.bottom, 24)
    }
}

struct ApplyExtensionView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyExtensionView()
    }
}

private struct CardView: View {
    var description = "1층"
    
    var body: some View {
        return HStack {
            HStack {
                VStack {
                    Text(description)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.bottom, 2)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: .infinity)
        .background(Color("CustomWhite"))
        .cornerRadius(12)
        .padding(.top, 16)
        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
    }
}
