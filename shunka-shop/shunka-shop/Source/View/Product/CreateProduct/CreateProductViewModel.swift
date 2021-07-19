//
//  CreateProductViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15/06/2021.
//

import Foundation
import Combine

extension CreateProductViewModel {
    struct Output {
        var productName: String
        var pricePerKilo: Float
        var availableQuantity: Float
        var productionYear: Int
        var productionMonth: Month
    }
}

class CreateProductViewModel: ObservableObject {
    @Published var productName: String = ""
    @Published var pricePerKilo: String = ""
    @Published var availableQuantity: String = ""
    @Published var productionYear: String = ""
    @Published var productionMonth: String = ""
        
    @Published var productNameError: String?
    @Published var pricePerKiloError: String?
    @Published var availableQuantityError: String?
    @Published var productionYearError: String?
    @Published var productionMonthError: String?
    
    @Published var isFormValid = false

    private var productNameValidationResult: ValidationResult<String>? {
        didSet {
            productNameError = productNameValidationResult?.error?.localizedDescription
            calculateIsFormValid()
        }
    }
    private var pricePerKiloValidationResult: ValidationResult<Float>? {
        didSet {
            pricePerKiloError = pricePerKiloValidationResult?.error?.localizedDescription
            calculateIsFormValid()
        }
    }
    private var availableQuantityValidationResult: ValidationResult<Float>? {
        didSet {
            availableQuantityError = availableQuantityValidationResult?.error?.localizedDescription
            calculateIsFormValid()
        }
    }
    private var productionYearValidationResult: ValidationResult<Int>? {
        didSet {
            productNameError = productNameValidationResult?.error?.localizedDescription
            calculateIsFormValid()
        }
    }
    private var productionMonthValidationResult: ValidationResult<Month>? {
        didSet {
            productionMonthError = productionMonthValidationResult?.error?.localizedDescription
            calculateIsFormValid()
        }
    }
    
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        registerValidatorFor(productName: $productName)
        registerValidatorFor(pricePerKilo: $pricePerKilo)
        registerValidatorFor(availableQuantity: $availableQuantity)
        registerValidatorFor(productionYear: $productionYear)
        registerValidatorFor(productionMonth: $productionMonth)
    }
    
    func create() {
        let output = generateOutput()
        debugPrint("output: \(output)")
    }

    private func generateOutput() -> Output {
        Output(productName: productNameValidationResult!.value!,
               pricePerKilo: pricePerKiloValidationResult!.value!,
               availableQuantity: availableQuantityValidationResult!.value!,
               productionYear: productionYearValidationResult!.value!,
               productionMonth: productionMonthValidationResult!.value!)
    }
}

// MARK: - Validation

extension CreateProductViewModel {
    
    private func calculateIsFormValid() {
        isFormValid =
            productNameValidationResult?.isValid ?? false
            && pricePerKiloValidationResult?.isValid ?? false
            && availableQuantityValidationResult?.isValid ?? false
            && productionYearValidationResult?.isValid ?? false
            && productionMonthValidationResult?.isValid ?? false
    }
    
    private func registerValidatorFor(productName: Published<String>.Publisher) {
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
            .sink { result in
                self.productNameValidationResult = result
            }
            .store(in: &subscribers)
    }
    
    private func registerValidatorFor(pricePerKilo: Published<String>.Publisher) {
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
            .sink { result in
                self.pricePerKiloValidationResult = result
            }
            .store(in: &subscribers)
    }
    
    private func registerValidatorFor(availableQuantity: Published<String>.Publisher) {
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
            .sink { result in
                self.availableQuantityValidationResult = result
            }
            .store(in: &subscribers)
    }
    
    private func registerValidatorFor(productionYear: Published<String>.Publisher) {
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
            .sink { result in
                self.productionYearValidationResult = result
            }
            .store(in: &subscribers)
    }
    
    private func registerValidatorFor(productionMonth: Published<String>.Publisher) {
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
            .sink { result in
                self.productionMonthValidationResult = result
            }
            .store(in: &subscribers)
    }
}
