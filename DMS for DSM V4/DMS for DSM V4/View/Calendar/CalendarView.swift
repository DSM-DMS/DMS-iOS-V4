//
//  CalendarView.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

struct CalendarView: View {

    @State private var monthCount = 0
    @State private var showCalendar = true

    var rkManager = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(-60*60*24*365), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 60)
            MainCalendarView(isPresented: $showCalendar, monthCount: $monthCount, rkManager: self.rkManager)
            Spacer()
        }
    }
}

struct DatePlan: Identifiable {
    
    var id = UUID()
    var planName: String
    var planPlace: String
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

private struct MainCalendarView: View {
    
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
