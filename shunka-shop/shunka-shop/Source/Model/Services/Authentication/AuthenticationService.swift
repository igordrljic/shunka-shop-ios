//
//  AuthenticationProvider.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

protocol AuthenticationService {
    func login(username: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void)
}
