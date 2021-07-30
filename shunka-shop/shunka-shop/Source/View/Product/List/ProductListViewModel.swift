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
    private let getProductsUseCase: GetProducts
    private let productStorage: ProductStorage
    private lazy var productStream: AnyCancellable = {
        productStorage.storageUpdatePublisher.sink { products in
            self.products = products
        }
    }()
    
    init(productService: ProductService = ServiceInjector.shared.product,
         productStorage: ProductStorage = DataStorageInjector.shared.product) {
        self.productStorage = productStorage
        self.getProductsUseCase = GetProducts(productService: productService,
                                              productStorage: productStorage)
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
            case let .failure(error):
                self.error = PresentableError(message: error.localizedDescription)
            }
        }
    }
}
