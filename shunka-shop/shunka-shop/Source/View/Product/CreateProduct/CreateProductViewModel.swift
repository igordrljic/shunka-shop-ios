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
    private var validationResults = FormValidationResults<Field>()
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        setFieldsOrder()
    }
    
    func create() {
        let output = generateOutput()
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
                        self.productNameError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: .productName)
                    }
                    .store(in: &subscribers)
            case .pricePerKilo:
                validatorFactory.validatorFor(pricePerKilo: $pricePerKilo.eraseToAnyPublisher())
                    .sink { result in
                        self.pricePerKiloError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: .pricePerKilo)
                    }
                    .store(in: &subscribers)
            case .availableQuantity:
                validatorFactory.validatorFor(availableQuantity: $availableQuantity.eraseToAnyPublisher())
                    .sink { result in
                        self.availableQuantityError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: .availableQuantity)
                    }
                    .store(in: &subscribers)
            case .productionYear:
                validatorFactory.validatorFor(productionYear: $productionYear.eraseToAnyPublisher())
                    .sink { result in
                        self.productionYearError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: .productionYear)
                    }
                    .store(in: &subscribers)
            case .productionMonth:
                validatorFactory.validatorFor(productionMonth: $productionMonth.eraseToAnyPublisher())
                    .sink { result in
                        self.productionMonthError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: .productionMonth)
                    }
                    .store(in: &subscribers)
            }
        }
    }
    
    func generateOutput() -> Output {
        Output(productName: validationResults.getResult(for: .productName)!.value!,
               pricePerKilo: validationResults.getResult(for: .pricePerKilo)!.value!,
               availableQuantity: validationResults.getResult(for: .availableQuantity)!.value!,
               productionYear: validationResults.getResult(for: .productionYear)!.value!,
               productionMonth: validationResults.getResult(for: .productionMonth)!.value!)
    }
}
