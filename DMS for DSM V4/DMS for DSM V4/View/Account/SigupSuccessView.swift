//
//  SigupSuccessView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/02.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct SigupSuccessView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("dmsLogo")
                .frame(width: 112, height: 68)
            Text("회원가입 완료")
                .font(Font.system(size: 20))
                .foregroundColor(Color("CustomGreen"))
                .fontWeight(.bold)
                .padding(.bottom, 6)
                .padding(.top, 36)
            Text("이제부터 DMS를 사용하실 수 있습니다")
                .font(Font.system(size: 16))
            Spacer()
            Button("완료") {}
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                .foregroundColor(Color.white)
                .background(Color("CustomGreen"))
                .cornerRadius(8)
                .padding(.bottom, 24)
                .padding(.horizontal, 24)
        }
    }
}

struct SigupSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SigupSuccessView()
    }
}
