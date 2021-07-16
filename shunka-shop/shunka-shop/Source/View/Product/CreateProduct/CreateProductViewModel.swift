//
//  CreateProductViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15/06/2021.
//

import Foundation
import Combine

class CreateProductViewModel: ObservableObject {
    @Published var productName: String = ""
    @Published var pricePerKilo: String = ""
    @Published var availableQuantity: String = ""
    @Published var productionYear: String = ""
    @Published var productionMonth: String = ""
    
    lazy var validator = CreateProductValidator(productName: $productName,
                                                pricePerKilo: $pricePerKilo,
                                                availableQuantity: $availableQuantity,
                                                productionYear: $productionYear,
                                                productionMonth: $productionMonth)
    
    func create() {
        
    }
}

class CreateProductValidator {
    private struct Input {
        var productName: String
        var pricePerKilo: String
        var availableQuantity: String
        var productionYear: String
        var productionMonth: String
    }
    struct Output {
        var productName: String = ""
        var pricePerKilo: Float = 0
        var availableQuantity: Float = 0
        var productionYear: Int = 0
        var productionMonth: Int = 0
    }
    
    @Published var productNameError: String?
    @Published var pricePerKiloError: String?
    @Published var availableQuantityError: String?
    @Published var productionYearError: String?
    @Published var productionMonthError: String?
    @Published var isFormValid = false
    
    private (set) var output = Output()
    
    private var subscribers = Set<AnyCancellable>()
    
    init(productName: Published<String>.Publisher,
         pricePerKilo: Published<String>.Publisher,
         availableQuantity: Published<String>.Publisher,
         productionYear: Published<String>.Publisher,
         productionMonth: Published<String>.Publisher) {
//        productName
//            .combineLatest(pricePerKilo)
//            .combineLatest(availableQuantity)
//            .combineLatest(productionYear)
//            .combineLatest(productionMonth)
//            .dropFirst()
//            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .map { result in
//                Input(productName: result.0.0.0.0,
//                      pricePerKilo: result.0.0.0.1,
//                      availableQuantity: result.0.0.1,
//                      productionYear: result.0.1,
//                      productionMonth: result.1)
//            }
//            .sink { input in
//                self.isFormValid = self.productNameError == nil &&
//                    self.pricePerKiloError == nil &&
//                    self.availableQuantityError == nil &&
//                    self.productionYearError == nil &&
//                    self.productionMonthError == nil
//            }
//            .store(in: &subscribers)
        
        productName
//            .mandatoryInput()
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    debugPrint("*** error: \(error)")
                    self.output.productName = ""
                    self.productNameError = error.localizedDescription
                case .finished:
                    debugPrint("*** finished")
                }
            }, receiveValue: { value in
                debugPrint("*** value: \(value)")
                self.output.productName = value
                self.productNameError = nil
            })
            .store(in: &subscribers)
    }
}
