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
    
    private var products: [Product] = []
    
    private (set) lazy var storageUpdatePublisher = {
        CurrentValueSubject<[Product], Never>(self.products)
    }()
    
    func set(products: [Product], completion: (Result<Void, Error>) -> Void) {
        self.products = products
        debugPrint("*** publish products: \(products)")
        storageUpdatePublisher.send(products)
        completion(.success(()))
    }
    
    private init() {}
}
