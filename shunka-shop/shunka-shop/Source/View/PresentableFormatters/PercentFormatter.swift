//
//  PercentFormatter.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15.2.22..
//

import Foundation

enum PercentFormatter {
    private static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale.appDefault
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter
    }()
    
    static func format(_ quantity: Int) -> String {
        if let quantity = numberFormatter.string(from: NSNumber(value: quantity)) {
            return quantity + "%"
        } else {
            return Strings.unknown
        }
    }
    
    static func format(_ quantity: Float) -> String {
        if let quantity = numberFormatter.string(from: NSNumber(value: quantity)) {
            return quantity + "%"
        } else {
            return Strings.unknown
        }
    }
    
    static func format(_ quantity: Double) -> String {
        if let quantity = numberFormatter.string(from: NSNumber(value: quantity)) {
            return quantity + "%"
        } else {
            return Strings.unknown
        }
    }
}
