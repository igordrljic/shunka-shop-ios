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
                .foregroundColor(.themePrimaryText)
                .padding(.bottom, 4)
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center) {
                    Text(Strings.orderedOn + ":").foregroundColor(.themeSecondaryText)
                    Text(order.createdAt.presentable).foregroundColor(.themePrimaryText)
                }
                HStack(alignment: .center) {
                    Text(Strings.total + ":").foregroundColor(.themeSecondaryText)
                    Text(AmountFormatter.format(order.total)).foregroundColor(.themePrimaryText)
                }
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}
