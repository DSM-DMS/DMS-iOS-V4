//
//  Toaster.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

public struct ToasterView: View {
    @Binding var isShowed: Bool
    @State private var isAppeared = false
    
    var toastTitle: String = "제목입니다"
    var toastDescription: String = "내용이 들어가요"
    
    public var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 240, height: 60)
                .cornerRadius(16)
                .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                .foregroundColor(Color("CustomWhite"))
                VStack {
                    Text(toastTitle)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("CustomGreen"))
                    Spacer()
                        .frame(height: 2)
                    Text(toastDescription)
                        .font(.system(size: 12))
                }
            }
            Spacer()
        }
        .padding(.top, isAppeared ? 20:-110)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .onAppear(perform: delaying)
    }
    
    private func delaying() {
        self.isAppeared = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            self.isAppeared = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isShowed = false
        }
    }
}

struct Toaster_Previews: PreviewProvider {
    static var previews: some View {
        ToasterView(isShowed: .constant(true))
    }
}

