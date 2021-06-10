//
//  ShunkaShopWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

class ShunkaShop: Webservice {
    static let shared = ShunkaShop()
    
    let defaultEncoding = JSONEncoding()
    let defaultDecoding = JSONDecoding()
    private (set) var baseUrl: URL
    private (set) var headers: HTTPHeader = [:]
    
    private init() {
        baseUrl = AppConfiguration.shared.shunkaShopBaseUrl
    }
    
    func set(authenticationToken token: String) {
        headers["x-auth-token"] = token
    }
}
