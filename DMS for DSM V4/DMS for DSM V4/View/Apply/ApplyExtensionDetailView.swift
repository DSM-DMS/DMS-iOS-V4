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
    var classNameArr = [["가온실", "나온실", "다온실", "라온실"], ["2층여자자습실"], ["3층학교측자습실", "3층계단측자습실", "3층쇼파"], ["4층학교측자습실", "4층복도측자습실"], ["5층열린교실"]]
    private let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
    
    @State var isTwelve = false
    @State var mapArray = [[String]]()
    @State private var offsetX: CGFloat = .zero
    @State private var offsetY: CGFloat = .zero
    @State var selectedTime = 11
    @State var selectedClass = 1
    @State var selectedSeat = 0
    @State private var mapWidth = 0
    @State private var mapHeight = 0
    
    var body: some View {
        VStack {
            Text("\(floor)층")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color("CustomGreen"))
            HStack {
                ForEach(0..<classNameArr[floor - 1].count, id: \.self) { i in
                    ClassNameView(className: "\(self.classNameArr[self.floor - 1][i])")
                        .onTapGesture {
                            self.selectedClass = i + 1 
                            self.getMap()
                    }
                }
            }
            .frame(height: 33)
            .padding(.horizontal, 19)
            ScrollView([.horizontal, .vertical]) {
                VStack {
                    ForEach(0..<mapArray.count, id: \.self) { i in
                        HStack {
                            ForEach(0..<self.mapArray[i].count, id: \.self) { j in
                                btnEmpty(btnText: self.mapArray[i][j])
                            }
                        }
                    }
                }
                .background(rectReader())
                .offset(x: offsetX, y: offsetY)
            }
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
            .background(Color("CustomWhite"))
            .cornerRadius(12)
            .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            
            HStack {
                Text("11시")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 33, maxHeight: .infinity)
                    .foregroundColor(isTwelve ? Color("CustomBlack") : Color("CustomWhite"))
                    .background(isTwelve ? Color("CustomWhite"): Color("CustomGreen"))
                    .cornerRadius(12)
                    .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                    .onTapGesture {
                        self.isTwelve = false
                }
                Text("12시")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 33, maxHeight: .infinity)
                    .foregroundColor(isTwelve ? Color("CustomWhite") : Color("CustomBlack"))
                    .background(isTwelve ? Color("CustomGreen"): Color("CustomWhite"))
                    .cornerRadius(12)
                    .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
                    .onTapGesture {
                        self.isTwelve = true
                }
            }
            .frame(height: 33)
            .padding(.horizontal, 24)
            .animation(.easeInOut(duration: 0.2))
            Spacer()
        }
        .padding(.top, 16)
        .onAppear {
            self.getMap()
        }
        .onReceive(orientationPublisher) { _ in
            self.offsetX = .zero
        }
    }
    
    func rectReader() -> some View {
        return GeometryReader { (geometry) -> AnyView in
            let offsetX: CGFloat
            let offsetY: CGFloat
            if CGFloat(self.mapWidth) >= (UIScreen.screenWidth - 48) {
                offsetX = 0
            } else {
                offsetX = 0
            }
            if CGFloat(self.mapHeight) >= (UIScreen.screenHeight - 48) {
                offsetY = 0
            } else {
                offsetY = 0
            }
            
            if self.offsetX == .zero {
                DispatchQueue.main.async {
                    self.offsetX = CGFloat(offsetX)
                }
            } else if self.offsetY == .zero {
                DispatchQueue.main.async {
                    self.offsetY = CGFloat(offsetY)
                }
            }
            return AnyView(Rectangle().fill(Color.clear))
        }
    }
}

extension ApplyExtensionDetailView {
    func getMap() {
        selectedSeat = 0
        _ = Connector.instance
            .getRequest(ApplyAPI.getExtensionMap(time: String(selectedTime), classNum: String(selectedClass)), method: .get)
            .decodeData(MypageModel.self)
            .subscribe(onNext: { [self] code, str, data in
                switch code{
                case 200:
                    let mappingArr = self.changeToInt(arr: data["map"] as! [[Any]])
                    self.mapHeight = (44 + 8) * mappingArr.count
                    self.mapWidth = (44 + 6) * mappingArr[0].count
                    self.mapArray = mappingArr
                default: print(code)
                }
            })
    }
    
    func changeToInt(arr: [[Any]]) -> [[String]] {
        var outPut = [[String]]()
        var temp = [String]()
        
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                temp.append("\(arr[i][j])")
            }
            outPut.append(temp)
            temp.removeAll()
        }
        
        return outPut
    }
}

struct ApplyExtensionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyExtensionDetailView()
    }
}

struct ClassNameView: View {
    var className: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("CustomWhite"))
                .cornerRadius(12)
                .shadow(color: Color("CustomShadow"), radius: 3, x: 0, y: 3)
            Text("\(className)")
                .font(.system(size: 14))
        }
        .padding(.horizontal, 5)
    }
}

struct btnEmpty: View {
    
    @State private var color = Color("CustomEmptyButton")
    
    @State var btnText = ""
    
    var body: some View {
        Text(btnText)
            .font(.system(size: 12))
            .frame(width: 44, height: 44)
            .foregroundColor(Color("CustomWhite"))
            .background(color)
            .cornerRadius(22)
            .padding(.horizontal, 6)
            .padding(.vertical, 8)
            .onAppear {
                self.setButtonState()
        }
    }
    
    func setButtonState() {
        if btnText.isInt {
            if Int(btnText)! == -1 {
                color = Color("CustomUnableButton")
                btnText = "불가"
            } else if Int(btnText)! > 0 {
                color = Color("CustomEmptyButton")
                btnText = ""
            } else {
                color = Color("CustomWhite")
                btnText = ""
            }
        } else {
            color = Color("CustomGreen")
        }
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
