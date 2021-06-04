//
//  ProductWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import Foundation

class ProductWebservice: ProductService {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        Network.shared.run(ShunkaShop.shared.products, completion: completion)
    }
}
