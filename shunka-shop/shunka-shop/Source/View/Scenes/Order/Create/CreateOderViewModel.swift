//
//  CreateOderViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation
import Combine
import SwiftUI

extension CreateOrderView {
    class ViewModel: ObservableObject
    {
        @Published var isWorking = false
        @Published var error: PresentableError? = nil
        
        @Published private(set) var customers: [User] = []
        @Published private(set) var products: [Product] = []
        
        var selectedShippingDate: Date?
        private(set) var selectedCustomer: User?
        private(set) var selectedProductsIds: [String] = []
        
        private(set) var customerSelectionViewModel = SingleSelectionList<User>.ViewModel(objects: [])
        private(set) var productSelectionViewModel = SingleSelectionList<Product>.ViewModel(objects: [])
        
        private let loadUseCase: CreateOrderLoadUseCase
        private var isLoaded = false
        private var errors = [PresentableError]()
        
        init(loadUseCase: CreateOrderLoadUseCase = CreateOrderLoadUseCase()) {
            self.loadUseCase = loadUseCase
        }
        
        func load() {
            guard !isLoaded else {
                return
            }
            isLoaded = true
            reload()
        }
        
        func reload() {
            guard !isWorking else {
                return
            }
            isWorking = true
            
            errors.removeAll()
            loadUseCase.execute { result in
                
                self.isWorking = false
                
                switch result {
                case let .success(output):
                    self.customers = output.customers
                    self.customerSelectionViewModel = SingleSelectionList<User>.ViewModel(objects: output.customers)
                    self.products = output.products
                    self.productSelectionViewModel = SingleSelectionList<Product>.ViewModel(objects: output.products)
                case let .failure(errors):
                    self.errors = errors.errors.map { PresentableError(message: $0.localizedDescription) }
                    self.error = self.errors.first
                }
            }
        }
        
        func confirmCustomerSelection() {
            customerSelectionViewModel.confirmSelection()
            selectedCustomer = customerSelectionViewModel.selectedObject
        }
        
    }
}
