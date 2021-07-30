//
//  Order.swift
//  shunka-shop
//
//  Created by Igor Drljic on 29.7.21..
//

import Foundation

struct OrderItem: Decodable, Identifiable {
    let id: String
    let quantity: Float
    let discountInPercent: Float
    let pricePerKilo: Float
    let totalPrice: Float
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id", quantity, discountInPercent, pricePerKilo, totalPrice, name
    }
}

struct Order: Decodable, Identifiable {
    let id: String
    let createdAt: Date
    let products: [OrderItem]
    let total: Float
    let creatorName: String
    let customerName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id", createdAt, products, total, creatorName, customerName
    }
}
