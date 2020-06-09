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
    
    var body: some View {
        VStack {
            Text("\(floor)층")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color("CustomGreen"))
            HStack {
                Rectangle()
            }
            .frame(height: 33)
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
