//
//  UserWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation

class UserWebservice: UserService {
    private let webservice: ShunkaShop
    
    init(webservice: ShunkaShop = ShunkaShop.shared) {
        self.webservice = webservice
    }
    
    func getCustomers(completion: @escaping (Result<[User], Error>) -> Void) {
        webservice.run(webservice.customers(), completion: completion)
    }
}
