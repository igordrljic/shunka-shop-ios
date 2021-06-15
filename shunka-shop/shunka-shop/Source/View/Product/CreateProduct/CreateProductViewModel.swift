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
    
    @Published var productNameError: String?
    @Published var pricePerKiloError: String?
    @Published var availableQuantityError: String?
    @Published var productionYearError: String?
    @Published var productionMonthError: String?
    
    @Published var isFormValid: Bool = false
    
    func create() {
        
    }
}
