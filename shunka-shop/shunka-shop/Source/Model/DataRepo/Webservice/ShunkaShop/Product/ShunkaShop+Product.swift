//
//  ShunkaShop+Product.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

extension ShunkaShop {
    var products: Request<[Product]> {
        Request<[Product]>(url: baseUrl.appendingPathComponent("product"),
                           httpMethod: .get,
                           httpHeader: headers,
                           decoding: defaultDecoding)
    }
}
