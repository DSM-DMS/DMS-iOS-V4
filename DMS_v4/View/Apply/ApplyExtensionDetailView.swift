//
//  ApplyExtensionDetailView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/06/02.
//  Copyright © 2020 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyExtensionDetailView: View {
    
    var floor: Int = 0
    @State var isEleven = false
    
    var body: some View {
        VStack {
            Text("\(floor)층")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color("CustomGreen"))
            HStack {
                ClassNameView()
                ClassNameView()
                ClassNameView()
                ClassNameView()
            }
            .frame(height: 33)
            .padding(.horizontal, 19)
            Rectangle()
                .foregroundColor(Color("CustomWhite"))
                .cornerRadius(12)
                .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
            HStack {
                Rectangle()
                    .foregroundColor(Color("CustomGreen"))
                Rectangle()
            }
            .frame(height: 33)
            .padding(.horizontal, 24)
            Spacer()
        }
        .padding(.top, 16)
    }
}

struct ApplyExtensionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyExtensionDetailView()
    }
}

struct ClassNameView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("CustomWhite"))
                .cornerRadius(12)
                .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
            Text("가온실")
                .font(.system(size: 14))
        }
        .padding(.horizontal, 5)
    }
}
