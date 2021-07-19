//
//  CreateProductValidatorFactory.swift
//  shunka-shop
//
//  Created by Igor Drljic on 19.7.21..
//

import Foundation
import Combine

class CreateProductValidatorFactory {
        
    func validatorFor(productName: Published<String>.Publisher) -> AnyPublisher<ValidationResult<String>, Never> {
        productName
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .validate({ (input: String, result: @escaping (ValidationResult<String>) -> Void) in
                guard !input.isEmpty else {
                    result(.failure([InputValidationError.mandatoryField]))
                    return
                }
                guard input.count >= 2 else {
                    result(.failure([InputValidationError.mustBeLongerThan(count: 1)]))
                    return
                }
                result(.success(input))
            })
            .eraseToAnyPublisher()
    }
    
    func validatorFor(pricePerKilo: Published<String>.Publisher) -> AnyPublisher<ValidationResult<Float>, Never> {
        pricePerKilo
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .validate { (input: String, result: @escaping (ValidationResult<Float>) -> Void) in
                guard !input.isEmpty else {
                    result(.failure([InputValidationError.mandatoryField]))
                    return
                }
                guard let value = Float(input) else {
                    result(.failure([InputValidationError.decimalNumberExpected]))
                    return
                }
                guard value >= 0 else {
                    result(.failure([InputValidationError.positiveNumberExpected]))
                    return
                }
                result(.success(value))
            }
            .eraseToAnyPublisher()
    }
    
    func validatorFor(availableQuantity: Published<String>.Publisher) -> AnyPublisher<ValidationResult<Float>, Never> {
        availableQuantity
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .validate { (input: String, result: @escaping (ValidationResult<Float>) -> Void) in
                guard !input.isEmpty else {
                    result(.failure([InputValidationError.mandatoryField]))
                    return
                }
                guard let value = Float(input) else {
                    result(.failure([InputValidationError.decimalNumberExpected]))
                    return
                }
                guard value >= 0 else {
                    result(.failure([InputValidationError.positiveNumberExpected]))
                    return
                }
                result(.success(value))
            }
            .eraseToAnyPublisher()
    }
    
    func validatorFor(productionYear: Published<String>.Publisher) -> AnyPublisher<ValidationResult<Int>, Never> {
        productionYear
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .validate { (input: String, result: @escaping (ValidationResult<Int>) -> Void) in
                guard !input.isEmpty else {
                    result(.failure([InputValidationError.mandatoryField]))
                    return
                }
                guard let value = Int(input) else {
                    result(.failure([InputValidationError.integerNumberExpected]))
                    return
                }
                guard value >= 0 else {
                    result(.failure([InputValidationError.positiveNumberExpected]))
                    return
                }
                result(.success(value))
            }
            .eraseToAnyPublisher()
    }
    
    func validatorFor(productionMonth: Published<String>.Publisher) -> AnyPublisher<ValidationResult<Month>, Never> {
        productionMonth
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .validate { (input: String, result: @escaping (ValidationResult<Month>) -> Void) in
                guard !input.isEmpty else {
                    result(.failure([InputValidationError.mandatoryField]))
                    return
                }
                guard let value = Int(input) else {
                    result(.failure([InputValidationError.integerNumberExpected]))
                    return
                }
                guard let month = Month(rawValue: value) else {
                    result(.failure([InputValidationError.closedInterval(start: 1, end: 12)]))
                    return
                }
                result(.success(month))
            }
            .eraseToAnyPublisher()
    }
}
