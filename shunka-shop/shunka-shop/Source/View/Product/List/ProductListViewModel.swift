//
//  ProductListViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 04/06/2021.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isWorking = false
    @Published var error: PresentableError? = nil
    private var isLoaded = false
    private let getProductsUseCase = GetProducts()
    private let productStorage = DataStorageInjector.shared.productStorage
    private lazy var productStream: AnyCancellable = {
        productStorage.storageUpdatePublisher.sink { products in
            self.products = products
        }
    }()
    
    init() {
        _ = productStream
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
        getProductsUseCase.execute { result in
            self.isWorking = false
            switch result {
            case .success:
                self.error = nil
            case let .failure(err):
                if case let WebserviceError.wrappedData(data) = err,
                   let error = ShunkaShopWebserviceError(data: data) {
                    self.error = PresentableError(message: error.localizedDescription)
                } else {
                    self.error = PresentableError(message: WebserviceError.general.localizedDescription)
                }
            }
        }
    }
}
