//
//  ShunkaShopWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

class ShunkaShop: Webservice {
    static let shared = ShunkaShop()
    let baseUrl: URL = AppConfiguration.shared.shunkaShopBaseUrl
    let encoding: ParameterEncoding = JSONEncoding()
    let decoding: ResponseDecoding = JSONDecoding()
    private (set) var headers: HTTPHeader = [:]
    
    private init() {}
    
    func set(authenticationToken token: String) {
        headers["x-auth-token"] = token
    }
}
