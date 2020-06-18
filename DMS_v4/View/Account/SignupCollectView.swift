//
//  SignupCollectView.swift
//  DMS_v4
//
//  Created by leedonggi on 2020/06/17.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import SwiftUI

struct SignupCollectView: View {
    
    @State var goingNext = false
    
    var body: some View {
        VStack {
            HStack {
                SignupView()
                    .frame(width: UIScreen.screenWidth)
                    .animation(.easeInOut)
                ConfirmationView()
                    .frame(width: UIScreen.screenWidth)
                .animation(.easeInOut)
            }
            .offset(x: goingNext ? -UIScreen.screenWidth / 2: UIScreen.screenWidth / 2)
            HStack {
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(Color("CustomGreen"))
                        .frame(width: 48, height: 48)
                        .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color.white)
                        .frame(width: 16, height: 16)
                }
                .padding(.trailing, 24)
                .padding(.bottom, 24)
                .onTapGesture {
                    self.goingNext = true
                }
            }
            .frame(width: UIScreen.screenWidth)
        }
    }
}

struct SignupCollectView_Previews: PreviewProvider {
    static var previews: some View {
        SignupCollectView()
    }
}
