//
//  UsernameValidator.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25/05/2021.
//

import Foundation

class UsernameValidator: Validator {
    typealias Value = String
    var errors: [Error] = []
    
    func validate(_ value: String, completion: @escaping (Result<Value, Error>) -> Void) {
        errors.removeAll()
        if value.isEmpty {
            errors.append(UsernameError.mustNotBeEmpty)
            completion(.failure(errors[0]))
        } else {
            completion(.success(value))
        }
    }
}
