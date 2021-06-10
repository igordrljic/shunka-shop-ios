//
//  Product.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let pricePerKilo: Int
    let productionYear: Int
    let productionMonth: Int
    let availableQuantity: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "_id", name, pricePerKilo, productionYear, productionMonth, availableQuantity
    }
}
