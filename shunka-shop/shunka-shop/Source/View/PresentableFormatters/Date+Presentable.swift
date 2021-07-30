//
//  Date+Presentable.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation

extension Date {
    private static let presentableDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.locale = Locale(identifier: "sr_Latn_RS")
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE dd MMMM yyyy")
        return dateFormatter
    }()
    
    var presentable: String {
        Date.presentableDateFormatter.string(from: self)
    }
}
