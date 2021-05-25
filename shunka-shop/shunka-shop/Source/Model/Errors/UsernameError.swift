//
//  UsernameError.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25/05/2021.
//

import Foundation

enum UsernameError: LocalizedError {
    case mustNotBeEmpty
    
    public var errorDescription: String? {
        switch self {
        case .mustNotBeEmpty:
            return Strings.validateMustNotBeEmpty
        }
    }
}
