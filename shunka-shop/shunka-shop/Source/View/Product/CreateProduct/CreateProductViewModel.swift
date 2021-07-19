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

extension CreateProductViewModel {
    private class ValidationResults {
        var productNameValidationResult: ValidationResult<String>? {
            didSet { calculateIsFormValid() }
        }
        var pricePerKiloValidationResult: ValidationResult<Float>? {
            didSet { calculateIsFormValid() }
        }
        var availableQuantityValidationResult: ValidationResult<Float>? {
            didSet { calculateIsFormValid() }
        }
        var productionYearValidationResult: ValidationResult<Int>? {
            didSet { calculateIsFormValid() }
        }
        var productionMonthValidationResult: ValidationResult<Month>? {
            didSet { calculateIsFormValid() }
        }
        
        private (set) var isFormValid: Bool = false
        
        func calculateIsFormValid() {
            isFormValid = productNameValidationResult?.isValid ?? false
                && pricePerKiloValidationResult?.isValid ?? false
                && availableQuantityValidationResult?.isValid ?? false
                && productionYearValidationResult?.isValid ?? false
                && productionMonthValidationResult?.isValid ?? false
        }
        
        func generateOutput() -> Output {
            Output(productName: productNameValidationResult!.value!,
                   pricePerKilo: pricePerKiloValidationResult!.value!,
                   availableQuantity: availableQuantityValidationResult!.value!,
                   productionYear: productionYearValidationResult!.value!,
                   productionMonth: productionMonthValidationResult!.value!)
        }
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
    
    var isFormValid: Bool {
        validationResults.isFormValid
    }

    private var validatorFactory = CreateProductValidatorFactory()
    private var validationResults = ValidationResults()
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        createFieldValidators()
    }
    
    func create() {
        let output = validationResults.generateOutput()
        debugPrint("output: \(output)")
    }

    private func createFieldValidators() {
        validatorFactory.validatorFor(productName: $productName)
            .sink { result in
                self.productNameError = result.error?.localizedDescription
                self.validationResults.productNameValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(pricePerKilo: $pricePerKilo)
            .sink { result in
                self.pricePerKiloError = result.error?.localizedDescription
                self.validationResults.pricePerKiloValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(availableQuantity: $availableQuantity)
            .sink { result in
                self.availableQuantityError = result.error?.localizedDescription
                self.validationResults.availableQuantityValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(productionYear: $productionYear)
            .sink { result in
                self.productionYearError = result.error?.localizedDescription
                self.validationResults.productionYearValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(productionMonth: $productionMonth)
            .sink { result in
                self.productionMonthError = result.error?.localizedDescription
                self.validationResults.productionMonthValidationResult = result
            }
            .store(in: &subscribers)
    }
}
