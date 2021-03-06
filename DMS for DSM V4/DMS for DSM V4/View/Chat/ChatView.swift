//
//  ChatView.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

struct ChatView: View {
    @State private var message: String = ""
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 3)
    @State private var name = Array<String>.init(repeating: "", count: 3)
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ZStack {
                    Rectangle()
                        .frame(height: 35)
                        .foregroundColor(Color.init(red: 222/255, green: 222/255, blue: 222/255))
                        .cornerRadius(12)
                        .padding(.leading, 16)
                    TextField("메세지를 입력하세요...", text: $message, onEditingChanged: { if $0 { self.kGuardian.showField = 0 } }) {
                        UIApplication.shared.endEditing()
                    }
                    .background(GeometryGetter(rect: $kGuardian.rects[0]))
                    .font(Font.system(size: 12))
                    .padding(.leading, 32)
                    
                }
                Button(action: {
                    
                }) {
                    Image("icon_send")
                        .frame(width: 29, height: 29)
                        .foregroundColor(Color("CustomGreen"))
                }
                .padding(.horizontal, 16)
            }.offset(y: kGuardian.slide).animation(.easeOut(duration: 0.45))
                .padding(.bottom, 16)
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

