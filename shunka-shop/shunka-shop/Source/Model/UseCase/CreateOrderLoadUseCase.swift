//
//  CreateOrderLoadUseCase.swift
//  shunka-shop
//
//  Created by Igor Drljic on 20.4.22..
//

import Foundation
import Combine

class CreateOrderLoadUseCase {
    typealias InputType = Void
    typealias OutputType = Output
    
    struct Output
    {
        let customers: [User]
        let products: [Product]
    }
    
    struct Errors: Error
    {
        let errors: [Error]
    }
    
    private let userService: UserService
    private let productService: ProductService
    private let productStorage: ProductStorage
    
    private let dispatchQueue = DispatchQueue.global(qos: .userInitiated)
    private let dispatchGroup = DispatchGroup()
    
    private var customers: [User] = []
    private var products: [Product] = []
    private var errors: [Error] = []
    
    init(userService: UserService = ServiceInjector.shared.user,
         productService: ProductService = ServiceInjector.shared.product,
         productStorage: ProductStorage = DataStorageInjector.shared.product) {
        
        self.userService = userService
        self.productService = productService
        self.productStorage = productStorage
    }
    
    func execute(input: InputType = (), completion: @escaping (Result<OutputType, Errors>) -> Void = { _ in }) {
        
        errors.removeAll()
        
        dispatchQueue.async {
            
            self.dispatchGroup.enter()
            self.loadProducts {
                self.dispatchGroup.leave()
            }
            
            self.dispatchGroup.enter()
            self.loadCustomers {
                self.dispatchGroup.leave()
            }
            
            self.dispatchGroup.notify(
                qos: .userInitiated,
                flags: .barrier,
                queue: self.dispatchQueue,
                execute: {
                    DispatchQueue.main.async {
                        self.loadingFinished(completion: completion)
                    }
                })
        }
    }
    
    private func loadCustomers(completion: @escaping () -> Void) {
        
        userService.getCustomers { result in
            
            defer {
                completion()
            }
            
            switch result {
            
            case let .success(users):
                self.customers = users
            
            case let .failure(error):
                self.customers = []
                self.errors.append(error)
            }
        }
    }
    
    private func loadProducts(completion: @escaping () -> Void) {
        productService.getProducts { result in
            
            defer {
                completion()
            }
            
            switch result {
            
            case let .success(products):
                self.products = products
                
            case let .failure(error):
                self.products = []
                self.errors.append(error)
            }
        }
    }
    
    private func loadingFinished(completion: @escaping (Result<OutputType, Errors>) -> Void) {
        
        guard errors.isEmpty else {
            completion(.failure(.init(errors: errors)))
            return
        }
        
        completion(.success(.init(customers: self.customers,
                                  products: self.products)))
    }
}
