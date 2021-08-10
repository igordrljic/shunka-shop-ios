//
//  ShunkaShop+Users.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation

extension ShunkaShop {
    func users() -> Request {
        Request(url: baseUrl.appendingPathComponent("users"),
                httpMethod: .get,
                httpHeader: headers,
                decoding: decoding)
    }
}
