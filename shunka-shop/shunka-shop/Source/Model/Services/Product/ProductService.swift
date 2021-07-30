//
//  ProductService.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

protocol ProductService {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void)
    func create(product: CreateProductData, completion: @escaping (Result<Void, Error>) -> Void)
}
