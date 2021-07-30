//
//  DataStorageInjector.swift
//  shunka-shop
//
//  Created by Igor Drljic on 04/06/2021.
//

import Foundation

class DataStorageInjector {
    static let shared = DataStorageInjector()
    private init() {}
    
    var product: ProductStorage {
        ProductCache.shared
    }
    
    var order: OrderStorage {
        OrderCache.shared
    }
}
