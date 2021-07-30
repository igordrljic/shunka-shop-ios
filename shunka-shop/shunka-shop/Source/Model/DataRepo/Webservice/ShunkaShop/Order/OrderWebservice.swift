//
//  OrderWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation

class OrderWebservice: OrderService {
    private let webservice: ShunkaShop
    
    init(webservice: ShunkaShop = ShunkaShop.shared) {
        self.webservice = webservice
    }
    
    func getOrders(completion: @escaping (Result<[Order], Error>) -> Void) {
        webservice.run(webservice.orders(), completion: completion)
    }
}
