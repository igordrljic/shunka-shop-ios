//
//  AmountFormatter.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation

class AmountFormatter {
    static let shared = AmountFormatter()
    
    private let numberFormatter: NumberFormatter
    
    init(locale: Locale = Locale(identifier: "sr_Latn_RS")) {
        self.numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        numberFormatter.currencySymbol = locale.currencySymbol
        
        debugPrint(Locale.availableIdentifiers)
    }
        
    func format(_ amount: Int) -> String {
        numberFormatter.string(from: NSNumber(value: amount)) ?? Strings.unknown
    }
    
    func format(_ amount: Float) -> String {
        numberFormatter.string(from: NSNumber(value: amount)) ?? Strings.unknown
    }
    
    func format(_ amount: Double) -> String {
        numberFormatter.string(from: NSNumber(value: amount)) ?? Strings.unknown
    }
}
