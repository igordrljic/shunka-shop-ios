//
//  ShunkaShop+Authentication.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

extension ShunkaShop {
    func login(username: String, password: String) -> Request {
        let params = ["username": username,
                      "password": password]
        return Request(url: baseUrl.appendingPathComponent("login"),
                       httpMethod: .post,
                       parameters: params,
                       encoding: JSONEncoding(),
                       decoding: decoding)
    }
}
