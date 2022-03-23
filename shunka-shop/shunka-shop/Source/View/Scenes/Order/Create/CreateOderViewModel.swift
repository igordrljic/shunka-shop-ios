//
//  CreateOderViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation

extension CreateOrderView {
    class ViewModel: ObservableObject {
        @Published var customer: User?
        
        @Published var isWorking = false
        @Published var error: PresentableError? = nil
        
        @Published private(set) var customers: [User] = []
        
        private(set) var customerSelectionViewModel = SingleSelectionList<User>.ViewModel(objects: [])
        
        private let userService: UserService
        private var isLoaded = false
        
        private(set) var selectedCustomer: User?
        
        init(userService: UserService = UserWebservice()) {
            self.userService = userService
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
            userService.getCustomers { result in
                switch result {
                case let .success(users):
                    self.customers = users
                    self.customerSelectionViewModel = SingleSelectionList<User>.ViewModel(objects: users)
                    self.error = nil
                case let .failure(error):
                    self.customers = []
                    self.customerSelectionViewModel = SingleSelectionList<User>.ViewModel(objects: [])
                    self.error = PresentableError(message: error.localizedDescription)
                }
                self.isWorking = false
            }
        }
        
        func confirmCustomerSelection() {
            customerSelectionViewModel.confirmSelection()
            selectedCustomer = customerSelectionViewModel.selectedObject
        }
    }
}
