//
//  OrderDetailsView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 15.2.22..
//

import SwiftUI

class OrderDetailsViewModel: ObservableObject {
    let order: Order
    
    init(order: Order) {
        self.order = order
    }
}

struct OrderDetailsView: View {
    @EnvironmentObject var navigationState: CreateOrderNavigationState
    @ObservedObject var viewModel: OrderDetailsViewModel
    
    private var order: Order { viewModel.order }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(Strings.Order.creator + ":").foregroundColor(.themeSecondaryText)
                    Text(order.creatorName).foregroundColor(.themePrimaryText)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(Strings.Order.customer + ":").foregroundColor(.themeSecondaryText)
                    Text(order.customerName).foregroundColor(.themePrimaryText)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(Strings.Order.createdAtDate + ":").foregroundColor(.themeSecondaryText)
                    Text(order.createdAt.presentable).foregroundColor(.themePrimaryText)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(Strings.Order.total + ":").foregroundColor(.themeSecondaryText)
                    Text(AmountFormatter.format(order.total)).foregroundColor(.themePrimaryText)
                }
                Text(Strings.Order.items + ":").foregroundColor(.themeSecondaryText)
                    .padding(.vertical)
                ForEach(order.products) { orderItem in
                    OrderItemView(orderItem: orderItem)
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding()
        }
    }
}

private struct OrderItemView: View {
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

struct OrderDetailsView_Previews: PreviewProvider {
    private static let viewModel = OrderDetailsViewModel(order: order)
    static var previews: some View {
        NavigationView {
            OrderDetailsView(viewModel: viewModel)
                .environmentObject(AppNavigationState.shared.createOrderState)
        }
        .foregroundColor(.black)
        .navigationTitle(viewModel.order.customerName)
    }
    
    static let order = Order(id: "1",
                             createdAt: Date(),
                             products: [
                                OrderItem(id: "1",
                                          quantityInKilograms: 3,
                                          discountInPercent: 10,
                                          pricePerKilogram: 1000,
                                          totalPrice: 2700,
                                          name: "Shunka",
                                          comment: nil),
                                OrderItem(id: "2",
                                          quantityInKilograms: 3,
                                          discountInPercent: 10,
                                          pricePerKilogram: 1000,
                                          totalPrice: 2700,
                                          name: "Kulen",
                                          comment: nil),
                                OrderItem(id: "3",
                                          quantityInKilograms: 3,
                                          discountInPercent: 10,
                                          pricePerKilogram: 1000,
                                          totalPrice: 2700,
                                          name: "Kulen",
                                          comment: nil),
                                OrderItem(id: "4",
                                          quantityInKilograms: 3,
                                          discountInPercent: 10,
                                          pricePerKilogram: 1000,
                                          totalPrice: 2700,
                                          name: "Kulen",
                                          comment: nil),
                                OrderItem(id: "5",
                                          quantityInKilograms: 3,
                                          discountInPercent: 10,
                                          pricePerKilogram: 1000,
                                          totalPrice: 2700,
                                          name: "Kulen",
                                          comment: nil),
                                OrderItem(id: "6",
                                          quantityInKilograms: 3,
                                          discountInPercent: 10,
                                          pricePerKilogram: 1000,
                                          totalPrice: 2700,
                                          name: "Kulen",
                                          comment: nil),
                                OrderItem(id: "7",
                                          quantityInKilograms: 3,
                                          discountInPercent: 10,
                                          pricePerKilogram: 1000,
                                          totalPrice: 2700,
                                          name: "Kulen",
                                          comment: nil)
                             ],
                             total: 1_000_000.99,
                             creatorName: "Creator name",
                             customerName: "Customer name",
                             comment: nil)
}
