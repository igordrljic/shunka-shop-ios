//
//  FormValidationResults.swift
//  shunka-shop
//
//  Created by Igor Drljic on 20.7.21..
//

import Foundation

class FormValidationResults<Field: CaseIterable & Hashable> {
    private var values: [Field: Any] = [:]
    private var errors: [Field: [InputValidationError]] = [:]
    private var validityFlags: [Field: Bool] = {
        var isValid = [Field: Bool]()
        Field.allCases.forEach { field in
            isValid[field] = false
        }
        return isValid
    }()
    private (set) var isFormValid: Bool = false
    
    func set<Type>(_ result: ValidationResult<Type>, for field: Field) {
        values[field] = result.value
        errors[field] = result.errors
        validityFlags[field] = result.isValid
        calculateIsFormValid()
    }
    
    func getResult<Type>(for field: Field) -> ValidationResult<Type>? {
        if let value = values[field] as? Type {
            return .success(value)
        } else if let errors = errors[field] {
            return .failure(errors)
        } else {
            return nil
        }
    }

    private func calculateIsFormValid() {
        for flag in validityFlags.values {
            guard flag != false else {
                isFormValid = false
                return
            }
            isFormValid = true
        }
    }
}
