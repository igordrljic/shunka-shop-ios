//
//  OrderService.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation

protocol OrderService {
    func getOrders(completion: @escaping (Result<[Order], Error>) -> Void)
}
