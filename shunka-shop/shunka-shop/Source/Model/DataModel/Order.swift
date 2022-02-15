//
//  Order.swift
//  shunka-shop
//
//  Created by Igor Drljic on 29.7.21..
//

import Foundation

struct OrderItem: Decodable, Identifiable {
    let id: String
    let quantityInKilograms: Float
    let discountInPercent: Float
    let pricePerKilogram: Float
    let totalPrice: Float
    let name: String
    let comment: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id", quantityInKilograms = "quantity",
             discountInPercent, pricePerKilogram = "pricePerKilo",
             totalPrice, name, comment
    }
}

struct Order: Decodable, Identifiable {
    let id: String
    let createdAt: Date
    let products: [OrderItem]
    let total: Float
    let creatorName: String
    let customerName: String
    let comment: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id", createdAt, products, total, creatorName, customerName, comment
    }
}
