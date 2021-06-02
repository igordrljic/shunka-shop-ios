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
    let pruductionMonth: Int
    let availableQuantity: Double
}
