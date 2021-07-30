//
//  OrderStorage.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation
import Combine

protocol OrderStorage {
    var storageUpdatePublisher: CurrentValueSubject<[Order], Never> { get }
    func set(_ orders: [Order], completion: (Result<Void, Error>) -> Void)
}
