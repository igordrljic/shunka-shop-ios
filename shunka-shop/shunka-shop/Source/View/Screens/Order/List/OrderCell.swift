//
//  OrderCell.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30.7.21..
//

import SwiftUI

struct OrderCell: View {
    let order: Order
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(order.customerName)
                .font(.body)
                .foregroundColor(.primaryText)
                .padding(.bottom, 4)
            Group {
                Text(order.createdAt.presentable)
                Text(AmountFormatter.shared.format(order.total))
            }
            .font(.footnote)
            .foregroundColor(.secondaryText)
        }
        .padding(.vertical)
    }
}
