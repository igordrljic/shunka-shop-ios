//
//  ShunkaShop+Order.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation

extension ShunkaShop {
    func orders() -> Request {
        Request(url: baseUrl.appendingPathComponent("order"),
                httpMethod: .get,
                httpHeader: headers,
                decoding: decoding)
    }
}
