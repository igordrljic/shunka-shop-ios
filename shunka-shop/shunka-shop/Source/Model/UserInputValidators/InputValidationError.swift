//
//  InputValidationError.swift
//  shunka-shop
//
//  Created by Igor Drljic on 16.7.21..
//

import Foundation

enum InputValidationError: LocalizedError {
    case mandatoryField
    case decimalNumberExpected
    case integerNumberExpected
    case positiveNumberExpected
    case closedInterval(start: Int, end: Int)

    var errorDescription: String? {
        switch self {
        case .mandatoryField:
            return Strings.validateMustNotBeEmpty
        case .decimalNumberExpected:
            return "Decimal number expected"
        case .integerNumberExpected:
            return "Integer number expected"
        case .positiveNumberExpected:
            return "Positive number expected"
        case let .closedInterval(start: start, end: end):
            return "Expected value between \(start) and \(end) including these values"
        }
    }
}
