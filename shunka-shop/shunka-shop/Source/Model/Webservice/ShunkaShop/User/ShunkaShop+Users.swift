//
//  ShunkaShop+Users.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation

extension ShunkaShop {
    func customers() -> Request {
        Request(url: baseUrl.appendingPathComponent("users").appendingPathComponent("customers"),
                httpMethod: .get,
                httpHeader: headers,
                encoding: encoding,
                decoding: decoding)
    }
}
