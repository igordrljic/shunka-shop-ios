//
//  GetProducts.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import Foundation
import Combine

class GetProducts: UseCase {
    typealias InputType = Void
    typealias OutputType = Void
    
    private var productService: ProductService
    private var productStorage: ProductStorage
    
    init(productService: ProductService = ServiceInjector.shared.product,
         productStorage: ProductStorage = DataStorageInjector.shared.productStorage) {
        self.productService = productService
        self.productStorage = productStorage
    }
    
    func execute(input: Void = (), completion: @escaping (Result<Void, Error>) -> Void = { _ in }) {
        productService.getProducts(completion: { result in
            switch result {
            case let .success(products):
                debugPrint("*** fetched products: \(products)")
                self.productStorage.set(products: products) { result in
                    switch result {
                    case .success:
                        completion(.success(()))
                    case let .failure(error):
                        completion(.failure(error))
                    }
                }
            case let .failure(error):
                completion(.failure(error))
            }
        })
    }
}
