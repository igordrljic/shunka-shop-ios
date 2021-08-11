//
//  User.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

protocol UserService {
    func getCustomers(completion: @escaping (Result<[User], Error>) -> Void)
}
