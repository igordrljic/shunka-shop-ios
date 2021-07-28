//
//  CreateProductViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15/06/2021.
//

import Foundation
import Combine

extension Result: Identifiable {
    public var id: Int {
        switch self {
        case .success:
            return 1
        case .failure:
            return 2
        }
    }
}

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
    
    @Published var createProductResult: Result<String, Error>?
    @Published var isWorking: Bool = false
    
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
    private let productService: ProductService
    
    init(productService: ProductService = ServiceInjector.shared.product) {
        self.productService = productService
        setFieldsOrder()
    }
    
    func create() {
        guard !isWorking else {
            return
        }
        isWorking = true
        let createProductData = generateOutput()
        productService.create(product: createProductData) { result in
            switch result {
            case .success:
                self.createProductResult = .success(Strings.createProductSuccess)
            case let .failure(error):
                self.createProductResult = .failure(error)
            }
            self.isWorking = false
        }
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
                        self.validationResults.set(result, for: field)
                    }
                    .store(in: &subscribers)
            case .pricePerKilo:
                validatorFactory.validatorFor(pricePerKilo: $pricePerKilo.eraseToAnyPublisher())
                    .sink { result in
                        self.pricePerKiloError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: field)
                    }
                    .store(in: &subscribers)
            case .availableQuantity:
                validatorFactory.validatorFor(availableQuantity: $availableQuantity.eraseToAnyPublisher())
                    .sink { result in
                        self.availableQuantityError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: field)
                    }
                    .store(in: &subscribers)
            case .productionYear:
                validatorFactory.validatorFor(productionYear: $productionYear.eraseToAnyPublisher())
                    .sink { result in
                        self.productionYearError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: field)
                    }
                    .store(in: &subscribers)
            case .productionMonth:
                validatorFactory.validatorFor(productionMonth: $productionMonth.eraseToAnyPublisher())
                    .sink { result in
                        self.productionMonthError = result.firstError?.localizedDescription
                        self.validationResults.set(result, for: field)
                    }
                    .store(in: &subscribers)
            }
        }
    }
    
    private func generateOutput() -> CreateProductData {
        CreateProductData(name: validationResults.getResult(for: .productName)!.value!,
                          pricePerKilo: validationResults.getResult(for: .pricePerKilo)!.value!,
                          productionYear: validationResults.getResult(for: .productionYear)!.value!,
                          productionMonth: validationResults.getResult(for: .productionMonth)!.value!,
                          availableQuantity: validationResults.getResult(for: .availableQuantity)!.value!)
    }
}
