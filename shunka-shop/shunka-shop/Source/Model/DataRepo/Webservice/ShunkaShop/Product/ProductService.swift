//
//  ProductService.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import Foundation

protocol ProductService {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}
