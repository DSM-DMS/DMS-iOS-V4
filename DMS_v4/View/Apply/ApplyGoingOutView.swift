//
//  ApplyGoingOutView.swift
//  DMS_SwiftUI
//
//  Created by leedonggi on 2019/10/27.
//  Copyright © 2019 leedonggi. All rights reserved.
//

import SwiftUI

struct ApplyGoingOutView: View {
    
    @State private var tappingDate = false
    @State private var tappingTime = false
    @State private var tappingText = false
    @State private var txtWhere = ""
    @State private var monthCount = 0
    
    var rkManager1 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    
    var dateToGoout: String = ""
    var timeToGoout: String = ""
    var locationToGoout: String = ""
    
    var body: some View {
        VStack {
            Image("icon_outdoor_big")
                .padding(.top, 36)
                .padding(.bottom, 4)
            Text("외출 신청")
                .fontWeight(.bold)
                .font(Font.system(size: 18))
                .padding(.bottom, 20)
                .frame(width: 80)
            Text("주말 외출 및 평일 외출을 신청할 수 있습니다.")
                .fontWeight(.light)
                .font(Font.system(size: 14))
                .padding(.bottom, 56)
            TextView(beforeImage: "icon_date", afterImage: "icon_date_green", placeholder: self.getTextFromDate(date: self.rkManager1.selectedDate), colorName: tappingDate ? "CustomGreen" : "CustomBlack", imageOpacity: tappingDate ? 1 : 0)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            self.tappingDate.toggle()
                            self.tappingTime = false
                    }
            )
                .frame(height: 50)
            SubCalendarView(isPresented: self.$tappingDate, monthCount: $monthCount, rkManager: self.rkManager1)
                .frame(height: tappingDate ? 230 : -16)
                .opacity(tappingDate ? 1 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            TextView(beforeImage: "icon_time", afterImage: "icon_time_green", placeholder: "PM 12 : 30 ~ PM 20 : 30", selfNum: 0, colorName: tappingTime ? "CustomGreen" : "CustomBlack", imageOpacity: tappingTime ? 1 : 0)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            self.tappingTime.toggle()
                    }
            )
                .opacity(tappingDate ? 0 : 1)
                .frame(height: tappingDate ? 0 : 50)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            SetTimeView(isPresented: self.$tappingTime)
                .frame(height: tappingTime ? 230 : -16)
                .opacity(tappingTime ? 1 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            EditView(txtWhere: $txtWhere, tappingText: $tappingText, beforeImage: "icon_place", afterImage: "icon_place_green", placeholder: "행선지를 입력해주세요", selfNum: 0, colorName: tappingText ? "CustomGreen" : "CustomBlack", imageOpacity: tappingText ? 1 : 0)
                .opacity(tappingDate || tappingTime ? 0 : 1)
                .frame(height: tappingTime || tappingDate ? 0 : 50)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            self.tappingText = true
                    }
            )
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            Spacer()
            
            ButtomButton(buttonText: "신청")
        }
    }
}

extension View {
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        var dayName = "일요일"
        formatter.locale = .current
        formatter.dateFormat = "eeee"
        if date == nil {
            return ""
        }
        switch formatter.string(from: date) {
        case "Sunday":
            dayName = "일요일"
        case "Monday":
            dayName = "월요일"
        case "Tuesday":
            dayName = "화요일"
        case "Wednesday":
            dayName = "수요일"
        case "Thursday":
            dayName = "목요일"
        case "Friday":
            dayName = "금요일"
        case "Saturday":
            dayName = "토요일"
        default:
            dayName = "월요일"
        }
        formatter.dateFormat = "yyyy년 MM월 dd일 \(dayName)"
        return date == nil ? "" : formatter.string(from: date)
    }
}

struct ApplyGoingOutView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyGoingOutView()
    }
}

private struct TextView: View {
    let aniDuration = 0.2
    
    var beforeImage = ""
    var afterImage = ""
    var placeholder = ""
    var selfNum = 0
    var colorName = "CustomGreen"
    var imageOpacity = 1
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(beforeImage)
                        .frame(width: 16, height: 16)
                    Image(afterImage)
                        .frame(width: 16, height: 16)
                        .opacity(Double(imageOpacity))
                        .animation(.easeInOut(duration: aniDuration))
                }
                .padding(.trailing, 8)
                
                Text(makePlaceHolder())
                    .font(Font.system(size: 12))
                    .fontWeight(.regular)
                Spacer()
            }
            .padding(.horizontal, 32)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(colorName))
                .padding(.horizontal, 26)
                .padding(.top, -4)
                .padding(.bottom, 36)
                .animation(.easeInOut(duration: aniDuration))        }
    }
    
    func makePlaceHolder() -> String {
        if placeholder == "" {
            let currentDate = Date()
            return getTextFromDate(date: currentDate)
        } else {
            return placeholder
        }
    }
}

private struct EditView: View {
    
    @Binding var txtWhere: String
    @Binding var tappingText: Bool
    
    let aniDuration = 0.2
    
    var beforeImage = ""
    var afterImage = ""
    var placeholder = ""
    var selfNum = 0
    var colorName = "CustomGreen"
    var imageOpacity = 1
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(beforeImage)
                        .frame(width: 16, height: 16)
                    Image(afterImage)
                        .frame(width: 16, height: 16)
                        .opacity(Double(imageOpacity))
                        .animation(.easeInOut(duration: aniDuration))
                }
                .padding(.trailing, 8)
                
                TextField(makePlaceHolder(), text: $txtWhere) {
                    if UIApplication.shared.isEndEditing() {
                        self.tappingText = false
                    }
                }
                .font(Font.system(size: 12))
                Spacer()
            }
            .padding(.horizontal, 32)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(colorName))
                .padding(.horizontal, 26)
                .padding(.top, -4)
                .padding(.bottom, 36)
                .animation(.easeInOut(duration: aniDuration))        }
    }
    
    func makePlaceHolder() -> String {
        if placeholder == "" {
            let currentDate = Date()
            return getTextFromDate(date: currentDate)
        } else {
            return placeholder
        }
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        var dayName = "일요일"
        formatter.locale = .current
        formatter.dateFormat = "eeee"
        if date == nil {
            return ""
        }
        switch formatter.string(from: date) {
        case "Sunday":
            dayName = "일요일"
        case "Monday":
            dayName = "월요일"
        case "Tuesday":
            dayName = "화요일"
        case "Wednesday":
            dayName = "수요일"
        case "Thursday":
            dayName = "목요일"
        case "Friday":
            dayName = "금요일"
        case "Saturday":
            dayName = "토요일"
        default:
            dayName = "월요일"
        }
        formatter.dateFormat = "yyyy년 MM월 dd일 \(dayName)"
        return date == nil ? "" : formatter.string(from: date)
    }
}

private struct SubCalendarView: View {
    
    @Binding var isPresented: Bool
    @Binding var monthCount: Int
    
    @ObservedObject var rkManager: RKManager
    
    var count = 0
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {self.monthCount -= 1}) {
                    Image(systemName: "chevron.left")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("CustomBlack"))
                }
                Text("\(getCurrentMonnth())")
                    .frame(width: 120)
                    .font(.system(size: 14))
                Button(action: {self.monthCount += 1}) {
                    Image(systemName: "chevron.right")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("CustomBlack"))
                }
            }
            RKMonth(isPresented: self.$isPresented, rkManager: self.rkManager, monthOffset: monthCount)
                .padding(.top)
            
        }
        .padding(.top, -28)
        .padding(.horizontal, 24)
    }
    
    func getCurrentMonnth() -> String {
        var date = Date()
        date += TimeInterval(monthCount * 2678400)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월"
        let stringDate = dateFormatter.string(from: date)
        
        return stringDate
    }
}

private struct SetTimeView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("출발시간")
                        .font(.system(size: 14))
                    HStack() {
                        Text("12:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("13:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 14)
                    HStack() {
                        Text("14:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("15:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                    HStack() {
                        Text("16:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("17:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                    HStack() {
                        Text("18:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("19:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                    HStack() {
                        Text("20:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("21:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                }
                Spacer()
                    .frame(width: 40)
                VStack {
                    Text("귀사시간")
                        .font(.system(size: 14))
                    HStack() {
                        Text("12:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("13:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 14)
                    HStack() {
                        Text("14:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("15:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                    HStack() {
                        Text("16:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("17:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                    HStack() {
                        Text("18:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("19:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                    HStack() {
                        Text("20:00")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 20)
                        Text("21:00")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 10)
                }
            }
            Spacer()
        }
    }
}

struct SubCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SubCalendarView(isPresented: .constant(false), monthCount: .constant(0), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0))
            .previewLayout(.fixed(width: 350, height: 246))
        
    }
    
}

struct SetTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SetTimeView(isPresented: .constant(false))
            .previewLayout(.fixed(width: 350, height: 246))
    }
    
}
