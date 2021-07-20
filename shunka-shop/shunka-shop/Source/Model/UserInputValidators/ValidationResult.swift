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
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    var value: Value? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }
    
    var errors: [InputValidationError]? {
        switch self {
        case .success:
            return nil
        case let .failure(errors):
            return errors
        }
    }
    
    var firstError: InputValidationError? {
        switch self {
        case .success:
            return nil
        case let .failure(errors):
            return errors.first
        }
    }
}
