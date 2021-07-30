//
//  OrderCache.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation
import Combine

class OrderCache: OrderStorage {
    static let shared = OrderCache()
    
    private (set) lazy var storageUpdatePublisher: CurrentValueSubject<[Order], Never> = {
        CurrentValueSubject<[Order], Never>([Order]())
    }()
    
    func set(_ orders: [Order], completion: (Result<Void, Error>) -> Void) {
        storageUpdatePublisher.send(orders)
        completion(.success(Void()))
    }
}
