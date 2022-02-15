//
//  AmountFormatter.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation

enum AmountFormatter {
    private static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.appDefault
        numberFormatter.currencySymbol = Locale.appDefault.currencySymbol
        return numberFormatter
    }()
        
    static func format(_ amount: Int) -> String {
        numberFormatter.string(from: NSNumber(value: amount)) ?? Strings.unknown
    }
    
    static func format(_ amount: Float) -> String {
        numberFormatter.string(from: NSNumber(value: amount)) ?? Strings.unknown
    }
    
    static func format(_ amount: Double) -> String {
        numberFormatter.string(from: NSNumber(value: amount)) ?? Strings.unknown
    }
}
