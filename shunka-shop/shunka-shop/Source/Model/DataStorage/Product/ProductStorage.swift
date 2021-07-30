//
//  ProductStorage.swift
//  shunka-shop
//
//  Created by Igor Drljic on 04/06/2021.
//

import Foundation
import Combine

protocol ProductStorage {
    var storageUpdatePublisher: CurrentValueSubject<[Product], Never> { get }
    func set(products: [Product], completion: (Result<Void, Error>) -> Void)
}
