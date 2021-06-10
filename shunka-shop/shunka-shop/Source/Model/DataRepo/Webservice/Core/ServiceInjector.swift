//
//  DataProviderInjector.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

class ServiceInjector {
    static let shared = ServiceInjector()
    
    var authentication: AuthenticationService {
        AuthenticationWebservice()
    }
    
    var product: ProductService {
        ProductWebservice()
    }
}
