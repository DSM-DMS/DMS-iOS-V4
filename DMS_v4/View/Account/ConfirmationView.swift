//
//  ConfirmationView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/09/29.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ConfirmationView: View {
    @State private var code: String = ""
    @State private var editingCode = false
    
    let aniDuration = 0.2
    let message = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("확인코드 입력")
                    .fontWeight(.bold)
                    .foregroundColor(Color("CustomGreen"))
                    .font(Font.system(size: 24))
                    .padding(.leading, 24)
                    .padding(.top, 60)
                Spacer()
            }
            VStack {
                HStack {
                    ZStack {
                        Image("icon_code")
                            .frame(width: 24, height: 16)
                            .animation(.easeInOut(duration: aniDuration))
                        Image("icon_code_light")
                            .frame(width: 24, height: 16)
                            .animation(.easeInOut(duration: aniDuration))
                            .opacity(editingCode ? 1 : 0)
                    }
                    
                    SecureField("확인코드를입력해주세요", text: $code)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color(ColorToUse.getColor(.Black700)()))
                    Button("인증") {}
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 10))
                        .frame(width: 36, height: 18)
                        .background(Color("CustomGreen"))
                        .cornerRadius(4)
                }
                .padding(.horizontal, 32)
                .padding(.top, 60)
                Rectangle()
                    .frame(height: editingCode ? 2 : 1)
                    .foregroundColor(editingCode ? Color("CustomGreen") : Color(ColorToUse.getColor(.Black700)()))
                    .padding(.horizontal, 26)
                    .padding(.top, -4)
                    .animation(.easeInOut(duration: aniDuration))
                HStack {
                    Text(message)
                        .font(Font.system(size: 12))
                        .padding(.leading, 24)
                        .padding(.top, 60)
                        
                    Spacer()
                }
            }
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(Color("CustomGreen"))
                        .frame(width: 48, height: 48)
                        .onTapGesture {
                            self.editingCode.toggle()
                    }
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.white)
                        .frame(width: 16, height: 16)
                }
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}

enum msgCertificationStatus {
    case fail, success, nothing
    
    func getText() -> String {
        switch self {
        case .fail:
            return """
            인증에 실패하였습니다
            코드를 확인하신 후 다시 인증해 주세요
            """
        case .success:
            return """
            인증에 성공하였습니다
            계속 진행해 주세요
            """
        case .nothing:
            return ""
        }
    }
}
