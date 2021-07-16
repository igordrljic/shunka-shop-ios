//
//  ValidationResult.swift
//  shunka-shop
//
//  Created by Igor Drljic on 16.7.21..
//

import Foundation

enum ValidationResult<Value> {
    case success(Value)
    case failure([InputValidationError])
    
    var isValid: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}
