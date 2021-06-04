//
//  ShunkaShopWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

class ShunkaShop: Webservice {
    static let shared = ShunkaShop()
    
    private (set) var baseUrl: URL
    private (set) var headers: HTTPHeader = [:]
    
    private init() {
        baseUrl = AppConfiguration.shared.shunkaShopBaseUrl
    }
    
    func set(authenticationToken token: String) {
        headers["x-auth-token"] = token
    }
}

extension ShunkaShop {
    func login(username: String, password: String) -> Request<LoginResponse> {
        let params = ["username": username,
                      "password": password]
        return Request<LoginResponse>(url: baseUrl.appendingPathComponent("login"),
                        httpMethod: .post,
                        parameters: params,
                        parse: { data in
                            guard let data = data else {
                                throw WebserviceError.responseContainsNoData
                            }
                            return try JSONDecoder().decode(LoginResponse.self, from: data)
                        })
    }
    
    var allOrders: Request<Order> {
        Request<Order>(url: baseUrl.appendingPathComponent("order"),
                        httpMethod: .post,
                        httpHeader: headers,
                        parse: { data in
                            guard let data = data else {
                                throw WebserviceError.responseContainsNoData
                            }
                            return try JSONDecoder().decode(Order.self, from: data)
                        })
    }
    
    var products: Request<[Product]> {
        Request<[Product]>(url: baseUrl.appendingPathComponent("product"),
                           httpMethod: .get,
                           httpHeader: headers,
                           parse: { data in
                            guard let data = data else {
                                throw WebserviceError.responseContainsNoData
                            }
                            debugPrint("*** parsing products....")
                            return try JSONDecoder().decode([Product].self, from: data)
                           })
    }
}

struct Order: Codable {
    
}

struct LoginResponse: Decodable {
    let authenticationToken: String
}
