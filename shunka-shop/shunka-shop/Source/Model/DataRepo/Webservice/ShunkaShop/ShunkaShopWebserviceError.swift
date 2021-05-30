//
//  ShunkaShopWebserviceError.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

struct ShunkaShopWebserviceError: LocalizedError, Decodable {
    enum Code: Int, Decodable {
        case invalidUsernameOrPassword = 15
    }
    
    let code: Code
    let message: String
    
    var errorDescription: String? {
        switch code {
        case .invalidUsernameOrPassword:
            return "Invalid username or password"
        }
    }
}

extension ShunkaShopWebserviceError {
    init?(data: Data) {
        do {
            self = try JSONDecoder().decode(ShunkaShopWebserviceError.self, from: data)
        } catch {
            return nil
        }
    }
}
