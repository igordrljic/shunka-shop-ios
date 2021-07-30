//
//  PasswordErrors.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25/05/2021.
//

import Foundation

enum PasswordError: LocalizedError {
    case mustBeLongerThen(numberOfChars: Int)
    case mustContainAtLeastOneDigit
    case mustContainAtLeastOneSpecialChar
    case repeatedPasswordDoesNotMatchPassword
    
    public var errorDescription: String? {
        switch self {
        case .mustBeLongerThen(let numberOfChars):
            return "Must be longer than \(numberOfChars) characters"
        case .mustContainAtLeastOneDigit:
            return "Must contain at least one digit"
        case .mustContainAtLeastOneSpecialChar:
            return "Must contain at least one special character: \(PasswordValidator.specialChars)"
        case .repeatedPasswordDoesNotMatchPassword:
            return "Repeated password does not match password"
        }
    }
}
