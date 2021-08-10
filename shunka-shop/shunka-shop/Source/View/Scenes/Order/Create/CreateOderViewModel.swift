//
//  CreateOderViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation

extension CreateOrderView {
    class ViewModel: ObservableObject {
        @Published var isWorking = false
        @Published var error: PresentableError? = nil
        
        @Published private(set) var customers: [User] = []
        
        private let userService: UserService
        private var isLoaded = false
        
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
            userService.getUsers { result in
                switch result {
                case let .success(users):
                    self.customers = users
                    self.error = nil
                case let .failure(error):
                    self.customers = []
                    self.error = PresentableError(message: error.localizedDescription)
                }
                self.isWorking = false
            }
        }
    }
}
