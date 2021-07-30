//
//  ProductWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import Foundation

class ProductWebservice: ProductService {
    private let webservice: ShunkaShop

    init(webservice: ShunkaShop = ShunkaShop.shared) {
        self.webservice = webservice
    }
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        webservice.run(webservice.products(), completion: completion)
    }
    
    func create(product: CreateProductData, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let request = try webservice.create(product)
            webservice.run(request, completion: completion)
        } catch let error {
            completion(.failure(error))
        }
    }
}
