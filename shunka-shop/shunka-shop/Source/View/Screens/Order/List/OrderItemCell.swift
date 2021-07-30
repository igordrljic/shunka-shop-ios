//
//  OrderItemCell.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import SwiftUI

struct OrderItemCell: View {
    let orderItem: OrderItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(orderItem.name)
            Text(AmountFormatter.shared.format(orderItem.totalPrice))
        }
        .font(.footnote)
        .foregroundColor(.secondaryText)
    }
}
