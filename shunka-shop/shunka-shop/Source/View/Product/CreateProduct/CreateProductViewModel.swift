//
//  CreateProductViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15/06/2021.
//

import Foundation
import Combine

extension CreateProductViewModel {
    
    enum Field: Int, CaseIterable, Identifiable {
        case productName
        case pricePerKilo
        case availableQuantity
        case productionYear
        case productionMonth
        
        typealias ID = Int
        var id: ID { rawValue }
    }
    
    struct Output {
        var productName: String
        var pricePerKilo: Float
        var availableQuantity: Float
        var productionYear: Int
        var productionMonth: Month
    }
    
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

    private (set) var fields: [Field] = [] {
        didSet {
            subscribers.removeAll()
            createFieldValidators()
        }
    }
    
    private var validatorFactory = CreateProductValidatorFactory()
    private var validationResults = ValidationResults()
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        setFieldsOrder()
    }
    
    func create() {
        let output = validationResults.generateOutput()
        debugPrint("output: \(output)")
    }

    private func setFieldsOrder() {
        fields = [.productName,
                  .pricePerKilo,
                  .availableQuantity,
                  .productionYear,
                  .productionMonth]
    }
        
    private func createFieldValidators() {
        fields.forEach { field in
            switch field {
            case .productName:
                validatorFactory.validatorFor(productName: $productName.eraseToAnyPublisher())
                    .sink { result in
                        self.productNameError = result.error?.localizedDescription
                        self.validationResults.productNameValidationResult = result
                    }
                    .store(in: &subscribers)
            case .pricePerKilo:
                validatorFactory.validatorFor(pricePerKilo: $pricePerKilo.eraseToAnyPublisher())
                    .sink { result in
                        self.pricePerKiloError = result.error?.localizedDescription
                        self.validationResults.pricePerKiloValidationResult = result
                    }
                    .store(in: &subscribers)
            case .availableQuantity:
                validatorFactory.validatorFor(availableQuantity: $availableQuantity.eraseToAnyPublisher())
                    .sink { result in
                        self.availableQuantityError = result.error?.localizedDescription
                        self.validationResults.availableQuantityValidationResult = result
                    }
                    .store(in: &subscribers)
            case .productionYear:
                validatorFactory.validatorFor(productionYear: $productionYear.eraseToAnyPublisher())
                    .sink { result in
                        self.productionYearError = result.error?.localizedDescription
                        self.validationResults.productionYearValidationResult = result
                    }
                    .store(in: &subscribers)
            case .productionMonth:
                validatorFactory.validatorFor(productionMonth: $productionMonth.eraseToAnyPublisher())
                    .sink { result in
                        self.productionMonthError = result.error?.localizedDescription
                        self.validationResults.productionMonthValidationResult = result
                    }
                    .store(in: &subscribers)
            }
        }
    }
}
