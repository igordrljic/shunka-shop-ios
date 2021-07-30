//
//  ShunkaShopWebserviceError.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

struct ShunkaShopWebserviceError: LocalizedError, Decodable {
    enum Code: Int, Decodable {
        case requestDataValidation = 1
        case usernameNotUnique = 2
        case productNameNotUnique = 3
        case productCanNotBeFound = 4
        case itemNotFound = 5
        case orderIsAlreadyDelivered = 6
        case orderIsAlreadyPayed = 7
        case orderIsAlreadyPayedAndDelivered = 8
        case orderCanNotBeModified = 9
        case restrictedOrderStatusTransition = 10
        case saveToDatabaseFailed = 11
        case canNotConnectToDatabase = 12
        case orderedQuantityNotAvailable = 13
        case routeNotFound = 14
        case invalidUsernameOrPassword = 15
        case userCreationFailed = 16
        case userNotAuthenticated = 17
        case userNotAuthorized = 18
        case invalidAuthenticationToken = 19
    }
    
    let code: Code
    let message: String
    
    var errorDescription: String? {
        switch code {
        case .invalidUsernameOrPassword:
            return Strings.invalidUsernameOrPassword
        case .productNameNotUnique:
            return Strings.createProductNameTaken
        default:
            return Strings.generalError
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
