//
//  ProductCache.swift
//  shunka-shop
//
//  Created by Igor Drljic on 04/06/2021.
//

import Foundation
import Combine

class ProductCache: ProductStorage {
    static let shared = ProductCache()
    
    private (set) lazy var storageUpdatePublisher = {
        CurrentValueSubject<[Product], Never>([Product]())
    }()
    
    func set(products: [Product], completion: (Result<Void, Error>) -> Void) {
        storageUpdatePublisher.send(products)
        completion(.success(Void()))
    }
    
    private init() {}
}
