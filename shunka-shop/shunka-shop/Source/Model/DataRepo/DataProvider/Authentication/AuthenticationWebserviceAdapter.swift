//
//  AuthenticationWebserviceAdapter.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

class AuthenticationWebserviceAdapter: AuthenticationProvider {
    func login(username: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let request = ShunkaShop.shared.login(username: username, password: password)
        Network.shared.run(request, completion: completion)
    }
}
