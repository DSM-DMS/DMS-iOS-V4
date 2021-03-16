//
//  MealView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2020/09/24.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI
import RxSwift

struct MealView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var mealDate = Date()
    @State var mealArr = ["불러오는 중...", "불러오는 중...", "불러오는 중..."]
    @State var curPage = 0
    
    var txtDate = "2019년 8월 31일 목요일"
    let formatter = DateFormatter()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.mealDate = self.mealDate.addingTimeInterval(-60 * 60 * 24)
                    self.getData()
                }) {
                    Image(systemName: "chevron.left")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("CustomBlack"))
                }
                Text(getTextFromDate(date: mealDate))
                    .foregroundColor(Color("CustomGreen"))
                    .font(Font.system(size: 18))
                    .fontWeight(.bold)
                Button(action: {
                    self.mealDate = self.mealDate.addingTimeInterval(60 * 60 * 24)
                    self.getData()
                }) {
                    Image(systemName: "chevron.right")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("CustomBlack"))
                }
            }
            VStack(alignment: .hCenterred) {
                HStack() {
                    MealContentsView(mealArray: $mealArr)
                        .frame(minWidth: UIScreen.screenWidth - 6, maxWidth: UIScreen.screenWidth - 6, minHeight: 0, maxHeight: .infinity)
                    .padding(.top, 20)
                    .alignmentGuide(.hCenterred, computeValue: { $0.width / 2.0 })
                    MealContentsView(mealArray: $mealArr)
                    .frame(minWidth: UIScreen.screenWidth - 6, maxWidth: UIScreen.screenWidth - 6, minHeight: 0, maxHeight: .infinity)
                    .padding(.top, 20)
                    MealContentsView(mealArray: $mealArr)
                    .frame(minWidth: UIScreen.screenWidth - 6, maxWidth: UIScreen.screenWidth - 6, minHeight: 0, maxHeight: .infinity)
                    .padding(.top, 20)
                }
                .offset(x: viewState.width)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            }
            .frame(maxWidth: .infinity, alignment: Alignment(horizontal: .hCenterred, vertical: .center))
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState.width = value.translation.width - (CGFloat(self.curPage) * UIScreen.screenWidth)
                    self.show = true
                }
                .onEnded { value in
                    if value.translation.width > UIScreen.screenWidth / 2 {
                        self.curPage -= 1
                        if self.curPage < 0 {
                            self.curPage = 0
                        } else {
                            self.mealDate = self.mealDate.addingTimeInterval(-60 * 60 * 24)
                        }
                        self.viewState.width = -(CGFloat(self.curPage) * UIScreen.screenWidth)
                        self.show = false
                    } else if value.translation.width < -UIScreen.screenWidth / 2 {
                        self.curPage += 1
                        self.mealDate = self.mealDate.addingTimeInterval(60 * 60 * 24)
                        self.viewState.width = -(CGFloat(self.curPage) * UIScreen.screenWidth)
                        self.show = false
                    } else {
                        self.viewState.width = -CGFloat(self.curPage) * UIScreen.screenWidth
                    }
                    
                }
            )
        }
        .onAppear {
            self.getData()
        }
        .padding(.vertical, 36)
    }
    
    func getData() {
        _ = Connector.instance
                .getRequest(MealAPI.getMealInfo(date: getDateStr()), method: .get)
                .decodeData(MealModel.self)
                .subscribe(onNext: { [self] code, str, data in
                    switch code{
                    case 200:
                        self.mealArr = self.setData(data)
                    case 204: print(code)
                    default: print(code)
                    }
                })
    }
    
    func setData(_ json: [String: Any]) -> [String] {
        
        var breakfast = ""
        var lunch = ""
        var dinner = ""
        
        if json[getDateStr()] == nil {
            return ["불러오는 중...", "불러오는 중...", "불러오는 중..."]
        }
        
        let meals = json[getDateStr()] as! [String: [String]]
        
        if let bre = meals["breakfast"] {
            if bre.count == 1 {
                breakfast = "급식이 없습니다."
            } else {
                breakfast = getStr(bre)
            }
        } else { breakfast = "급식이 없습니다." }
        
        if let lun = meals["lunch"] {
            if lun.count == 1 {
                lunch = "급식이 없습니다."
            } else {
                lunch = getStr(lun)
            }
        } else { lunch = "급식이 없습니다." }
        
        if let din = meals["dinner"] {
            if din.count == 1 {
                dinner = "급식이 없습니다."
            } else {
                dinner = getStr(din)
            }
        } else { dinner = "급식이 없습니다." }
        
        return [breakfast, lunch, dinner]
    }
    
    private func getDateStr() -> String{
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: mealDate)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}

extension HorizontalAlignment {
   private enum HCenterAlignment: AlignmentID {
      static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
         return dimensions[HorizontalAlignment.center]
      }
   }
   static let hCenterred = HorizontalAlignment(HCenterAlignment.self)
}
