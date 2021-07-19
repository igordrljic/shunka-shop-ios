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
    
    private var validatorFactory = CreateProductValidatorFactory()
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        createFieldValidators()
    }
    
    func create() {
        let output = generateOutput()
        debugPrint("output: \(output)")
    }

    private func createFieldValidators() {
        validatorFactory.validatorFor(productName: $productName)
            .sink { result in
                self.productNameValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(pricePerKilo: $pricePerKilo)
            .sink { result in
                self.pricePerKiloValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(availableQuantity: $availableQuantity)
            .sink { result in
                self.availableQuantityValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(productionYear: $productionYear)
            .sink { result in
                self.productionYearValidationResult = result
            }
            .store(in: &subscribers)
        validatorFactory.validatorFor(productionMonth: $productionMonth)
            .sink { result in
                self.productionMonthValidationResult = result
            }
            .store(in: &subscribers)
    }
    
    private func calculateIsFormValid() {
        isFormValid = productNameValidationResult?.isValid ?? false
            && pricePerKiloValidationResult?.isValid ?? false
            && availableQuantityValidationResult?.isValid ?? false
            && productionYearValidationResult?.isValid ?? false
            && productionMonthValidationResult?.isValid ?? false
    }
    
    private func generateOutput() -> Output {
        Output(productName: productNameValidationResult!.value!,
               pricePerKilo: pricePerKiloValidationResult!.value!,
               availableQuantity: availableQuantityValidationResult!.value!,
               productionYear: productionYearValidationResult!.value!,
               productionMonth: productionMonthValidationResult!.value!)
    }
}
