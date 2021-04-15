//
//  CalendarCell.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

struct RKCell: View {
    
    var rkDate: RKDate
    
    var cellWidth: CGFloat
    
    var body: some View {
        Text(rkDate.getText())
            .fontWeight(rkDate.getFontWeight())
            .foregroundColor(rkDate.getTextColor())
            .frame(width: cellWidth, height: cellWidth)
            .font(.system(size: 12))
            .background(rkDate.getBackgroundColor())
            .cornerRadius(cellWidth/2)
    }
}

#if DEBUG
struct RKCell_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: false, isToday: false, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(20))
                .previewDisplayName("Control")
            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: true, isToday: false, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(20))
                .previewDisplayName("Disabled Date")
            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: false, isToday: true, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(20))
                .previewDisplayName("Today")
            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: false, isToday: false, isSelected: true, isBetweenStartAndEnd: false), cellWidth: CGFloat(20))
                .previewDisplayName("Selected Date")
            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: false, isToday: false, isSelected: false, isBetweenStartAndEnd: true), cellWidth: CGFloat(20))
                .previewDisplayName("Between Two Dates")
        }
        .previewLayout(.fixed(width: 300, height: 70))
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
#endif

