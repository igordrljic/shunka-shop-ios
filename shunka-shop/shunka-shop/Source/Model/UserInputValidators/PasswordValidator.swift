//
//  PasswordValidator.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25/05/2021.
//

import Foundation

class PasswordValidator: Validator {
    public typealias Value = String
    
    public static let specialChars = "!@#$%^&*"
    public static let minCharCount = 8
    
    public private (set) var errors: [Error] = []
    
    public init() {}
    
    public func validate(_ value: String, completion: @escaping (Result<String, Error>) -> Void) {
        errors.removeAll()
        if value.count < PasswordValidator.minCharCount {
            errors.append(PasswordError.mustBeLongerThen(numberOfChars: PasswordValidator.minCharCount))
        } else if value.range(of: #"\d+"#, options: .regularExpression) == nil {
            errors.append(PasswordError.mustContainAtLeastOneDigit)
        } else if value.range(of: #"[!@#$%^&*]+"#, options: .regularExpression) == nil {
            errors.append(PasswordError.mustContainAtLeastOneSpecialChar)
        }
        if errors.isEmpty {
            completion(.success(value))
        } else {
            completion(.failure(errors[0]))
        }
    }
}
