//
//  ConfirmationView.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

struct ConfirmationView: View {
    @State private var code: String = ""
    @State private var editingCode = false
    
    @Binding var isConfirmed: Bool
    
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
                        Image(systemName: "creditcard")
                            .frame(width: 24, height: 16)
                        .foregroundColor(Color("CustomText"))
                    }
                    
                    SecureField("확인코드를입력해주세요", text: $code)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color("CustomText"))
                    Button("인증") {
                        self.isConfirmed.toggle()
                    }
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
                    .foregroundColor(editingCode ? Color("CustomGreen") : Color("CustomText"))
                    .padding(.horizontal, 26)
                    .padding(.top, -4)
                HStack {
                    Text(message)
                        .font(Font.system(size: 12))
                        .padding(.leading, 24)
                        .padding(.top, 60)
                        
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(isConfirmed: .constant(false))
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

