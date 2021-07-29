//
//  AuthenticationWebserviceAdapter.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

class AuthenticationWebservice: AuthenticationService {
    private let webservice: ShunkaShop
    
    init(webservice: ShunkaShop = ShunkaShop.shared) {
        self.webservice = webservice
    }
    
    func login(username: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let request = webservice.login(username: username, password: password)
        webservice.run(request, completion: completion)
    }
}
