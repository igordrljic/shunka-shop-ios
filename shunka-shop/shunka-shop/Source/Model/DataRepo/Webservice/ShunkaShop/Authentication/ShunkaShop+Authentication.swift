//
//  ShunkaShop+Authentication.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10/06/2021.
//

import Foundation

extension ShunkaShop {
    func login(username: String, password: String) -> Request<LoginResponse> {
        let params = ["username": username,
                      "password": password]
        return Request<LoginResponse>(url: baseUrl.appendingPathComponent("login"),
                        httpMethod: .post,
                        parameters: params,
                        encoding: defaultEncoding,
                        decoding: defaultDecoding)
    }
}
