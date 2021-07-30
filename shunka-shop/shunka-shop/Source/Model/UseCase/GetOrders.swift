//
//  GetOrders.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation
import Combine

class GetOrders: UseCase {
    typealias InputType = Void
    typealias OutputType = Void
    
    private let orderService: OrderService
    private let orderStorage: OrderStorage
    
    init(orderService: OrderService = ServiceInjector.shared.order,
         orderStorage: OrderStorage = DataStorageInjector.shared.order) {
        self.orderService = orderService
        self.orderStorage = orderStorage
    }
    
    func execute(input: Void = (), completion: @escaping (Result<Void, Error>) -> Void = { _ in }) {
        orderService.getOrders { result in
            switch result {
            case let .success(orders):
                self.orderStorage.set(orders) { result in
                    switch result {
                    case .success:
                        completion(.success(Void()))
                    case let .failure(error):
                        completion(.failure(error))
                    }
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
