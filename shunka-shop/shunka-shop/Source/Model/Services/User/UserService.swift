//
//  User.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

protocol UserService {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
