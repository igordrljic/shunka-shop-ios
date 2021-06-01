//
//  LoginViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var usernameError: String? = nil
    @Published var passwordError: String? = nil
    @Published var isFormValid: Bool = false
    
    private let usernameValidator = UsernameValidator()
    private let passwordValidator = PasswordValidator()
    
    private lazy var validatedUsername: AnyPublisher<Result<String, Error>, Never> = {
        $username
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { username in
                Future { promise in
                    self.usernameValidator.validate(username) { result in
                        promise(.success(result))
                    }
                }
            }
            .eraseToAnyPublisher()
    }()
    private lazy var validatedPassword: AnyPublisher<Result<String, Error>, Never> = {
        $password
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { password in
                Future { promise in
                    self.passwordValidator.validate(password) { result in
                        promise(.success(result))
                    }
                }
            }
            .eraseToAnyPublisher()
    }()
    private lazy var validatedForm: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(validatedUsername, validatedPassword)
        .map { (usernameResult, passwordResult) in
            guard case let .success(username) = usernameResult, case let .success(password) = passwordResult else {
                return false
            }
            return true
        }
        .eraseToAnyPublisher()
    }()
    
    private var usernameStream: AnyCancellable!
    private var passwordStream: AnyCancellable!
    private var validatedFormStream: AnyCancellable!
    
    private let loginUseCase = LoginUseCase()
    
    init() {
        usernameStream = validatedUsername.sink { result in
            debugPrint("username: \(self.username)")
            switch result {
            case .success:
                self.usernameError = nil
            case let .failure(error):
                self.usernameError = error.localizedDescription
            }
        }
        passwordStream = validatedPassword.sink(receiveValue: { result in
            debugPrint("password: \(self.password)")
            switch result {
            case .success:
                self.passwordError = nil
            case let .failure(error):
                self.passwordError = error.localizedDescription
            }
        })
        validatedFormStream = validatedForm.sink(receiveValue: { isValid in
            self.isFormValid = isValid
        })
    }
    
    func login() {
        let input = LoginUseCase.Input(username: self.username, password: self.password)
        loginUseCase.execute(input: input) { result in
            switch result {
            case .success:
                debugPrint("login success!")
            case let .failure(error):
                debugPrint("login failed: \(error.localizedDescription)")
            }
        }
    }
}
