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
        VStack(alignment: .leading, spacing: 8) {
            Text(order.customerName)
                .font(.body)
                .foregroundColor(.primaryText)
                .padding(.bottom, 4)
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center) {
                    Text(Strings.orderedOn + ":").foregroundColor(.secondaryText)
                    Text(order.createdAt.presentable).foregroundColor(.primaryText)
                }
                HStack(alignment: .center) {
                    Text(Strings.total + ":").foregroundColor(.secondaryText)
                    Text(AmountFormatter.shared.format(order.total)).foregroundColor(.primaryText)
                }
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}
