//
//  OrderItemView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 6.5.22..
//

import SwiftUI

struct OrderItemView: View {
    let orderItem: OrderItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 4) {
                Text(Strings.Order.Item.productName + ":").foregroundColor(.themeSecondaryText)
                Text(orderItem.name).foregroundColor(.themePrimaryText)
                Spacer()
            }
            HStack(alignment: .center, spacing: 4) {
                Text(Strings.Order.Item.quantity + ":").foregroundColor(.themeSecondaryText)
                Text(QuantityFormatter.format(orderItem.quantityInKilograms))
                    .foregroundColor(.themePrimaryText)
                Spacer()
            }
            HStack(alignment: .center, spacing: 4) {
                Text(Strings.Order.Item.price + ":").foregroundColor(.themeSecondaryText)
                Text(AmountFormatter.format(orderItem.pricePerKilogram)).foregroundColor(.themePrimaryText)
                Spacer()
            }
            HStack(alignment: .center, spacing: 4) {
                Text(Strings.Order.Item.discount + ":").foregroundColor(.themeSecondaryText)
                Text(PercentFormatter.format(orderItem.discountInPercent)).foregroundColor(.themePrimaryText)
                Spacer()
            }
            HStack(alignment: .center, spacing: 4) {
                Text(Strings.Order.Item.total + ":").foregroundColor(.themeSecondaryText)
                Text(AmountFormatter.format(orderItem.totalPrice)).foregroundColor(.themePrimaryText)
                Spacer()
            }
            Spacer()
        }
        .font(.footnote)
    }
}
