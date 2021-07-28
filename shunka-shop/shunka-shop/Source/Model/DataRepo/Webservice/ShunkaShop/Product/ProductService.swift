//
//  ProductService.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import Foundation

struct CreateProductData: Encodable {
    let name: String
    let pricePerKilo: Float
    let productionYear: Int
    let productionMonth: Month
    let availableQuantity: Float
}

protocol ProductService {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void)
    func create(product: CreateProductData, completion: @escaping (Result<Void, Error>) -> Void)
}
