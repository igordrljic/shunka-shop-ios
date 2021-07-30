//
//  CreateProductData.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import Foundation

struct CreateProductData: Encodable {
    let name: String
    let pricePerKilo: Float
    let productionYear: Int
    let productionMonth: Month
    let producedQuantity: Float
    let availableQuantity: Float?
}
