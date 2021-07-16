//
//  Publisher+InputValidation.swift
//  shunka-shop
//
//  Created by Igor Drljic on 16.7.21..
//

import Foundation
import Combine

extension Publisher where Self.Failure == Never {
    func validate<Input, Output>(_ validation: @escaping (Input, @escaping (ValidationResult<Output>) -> Void) -> Void)
    -> InputValidationPublisher<Self, Input, Output> {
        InputValidationPublisher(upstream: self, validate: validation)
    }
}
