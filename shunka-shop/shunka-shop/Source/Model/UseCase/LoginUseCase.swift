//
//  LoginUseCase.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

class LoginUseCase: UseCase {
    typealias InputType = LoginUseCase.Input
    typealias OutputType = Void
    
    struct Input {
        let username: String
        let password: String
    }
    
    private let authenticationProvider: AuthenticationProvider
    
    init(authenticationProvider: AuthenticationProvider = DataProviderInjector.shared.authenticationProvider) {
        self.authenticationProvider = authenticationProvider
    }
    
    func execute(input: Input, completion: @escaping (Result<Void, Error>) -> Void) {
        authenticationProvider.login(username: input.username, password: input.password) { result in
            switch result {
            case let .success(response):
                ShunkaShop.shared.set(authenticationToken: response.authenticationToken)
                completion(.success(()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
