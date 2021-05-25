//
//  Validator.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25/05/2021.
//

import Foundation

protocol InputValidator {
    associatedtype Value
    var errors: [Error] { get }
    func validate(_ value: Value, completion: @escaping (Result<Value, Error>) -> Void)
}
