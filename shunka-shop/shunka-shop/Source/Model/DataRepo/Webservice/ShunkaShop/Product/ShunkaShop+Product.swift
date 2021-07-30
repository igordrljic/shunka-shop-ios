//
//  ShunkaShop+Product.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

extension ShunkaShop {
    func products() -> Request {
        Request(url: baseUrl.appendingPathComponent("product"),
                httpMethod: .get,
                httpHeader: headers,
                decoding: decoding)
    }
    
    func create(_ product: CreateProductData) throws -> Request {
        Request(url: baseUrl.appendingPathComponent("product"),
                httpMethod: .post,
                httpHeader: headers,
                parameters: try product.toParameters(),
                encoding: encoding,
                decoding: decoding)
    }
}
