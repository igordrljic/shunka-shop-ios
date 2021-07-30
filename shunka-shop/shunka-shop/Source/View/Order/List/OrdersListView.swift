//
//  OrdersListView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct OrdersListView: View {
    @ObservedObject var viewModel: OrderListViewModel
    
    var body: some View {
        List(viewModel.orders) { order in
            OrderCell(order: order)
        }
        .onAppear { viewModel.load() }
    }
}

struct OrderCell: View {
    let order: Order
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(order.customerName)
                .font(.body)
                .foregroundColor(.primaryText)
                .padding(.bottom, 4)
            Group {
                Text("\(order.createdAt)")
                Text("\(order.total)")
                VStack(alignment: .leading, spacing: 1) {
                    ForEach(order.products) { orderItem in
                        OrderItemCell(orderItem: orderItem)
                    }
                }
            }
            .font(.footnote)
            .foregroundColor(.secondaryText)
        }
        .padding(.vertical)
    }
}

struct OrderItemCell: View {
    let orderItem: OrderItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(orderItem.name)
            Text("\(orderItem.totalPrice)")
        }
        .font(.footnote)
        .foregroundColor(.secondaryText)
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView(viewModel: OrderListViewModel())
    }
}
