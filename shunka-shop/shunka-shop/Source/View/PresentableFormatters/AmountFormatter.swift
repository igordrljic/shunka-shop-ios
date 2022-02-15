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
        numberFormatter.roundingMode = .down
        numberFormatter.locale = Locale.appDefault
        numberFormatter.allowsFloats = true
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.currencySymbol = ""
        return numberFormatter
    }()
        
    static func format(_ amount: Int) -> String {
        if let string = numberFormatter.string(from: NSNumber(value: amount)),
           let currencySymbol = Locale.appDefault.currencySymbol {
            return string.trimmingCharacters(in: .whitespaces) + " " + currencySymbol
        } else {
            return Strings.unknown
        }
    }
    
    static func format(_ amount: Float) -> String {
        if let string = numberFormatter.string(from: NSNumber(value: amount)),
           let currencySymbol = Locale.appDefault.currencySymbol {
            return string.trimmingCharacters(in: .whitespaces) + " " + currencySymbol
        } else {
            return Strings.unknown
        }
    }
    
    static func format(_ amount: Double) -> String {
        if let string = numberFormatter.string(from: NSNumber(value: amount)),
           let currencySymbol = Locale.appDefault.currencySymbol {
            return string.trimmingCharacters(in: .whitespaces) + " " + currencySymbol
        } else {
            return Strings.unknown
        }
    }
}
