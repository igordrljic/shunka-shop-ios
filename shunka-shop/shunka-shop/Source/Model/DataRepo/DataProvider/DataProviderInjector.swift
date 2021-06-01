//
//  DataProviderInjector.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

class DataProviderInjector {
    static let shared = DataProviderInjector()
    
    var authenticationProvider: AuthenticationProvider {
        AuthenticationWebserviceAdapter()
    }
}
