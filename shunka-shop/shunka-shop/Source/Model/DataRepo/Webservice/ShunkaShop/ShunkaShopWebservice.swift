//
//  ShunkaShopWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

struct ShunkaShop: Webservice {
    static let shared = ShunkaShop()
    
    private (set) var baseUrl: URL
    
    private init() {
        let baseUrlString = "https://shunka-shop.herokuapp.com/api"
        guard let baseUrl = URL(string: baseUrlString) else {
            fatalError("Invalid webservice URL: \(baseUrlString)")
        }
        self.baseUrl = baseUrl
    }
}

extension ShunkaShop {
    func login(username: String, password: String) -> Request<String> {
        let params = ["username": username,
                      "password": password]
        return Request<String>(url: baseUrl.appendingPathComponent("login"),
                        httpMethod: .post,
                        parameters: params,
                        parse: { data in
                            guard let data = data else {
                                throw WebserviceError.responseContainsNoData
                            }
                            if let string = String(data: data, encoding: .utf8) {
                                return string
                            } else {
                                throw NSError()
                            }
                        })
    }
}
