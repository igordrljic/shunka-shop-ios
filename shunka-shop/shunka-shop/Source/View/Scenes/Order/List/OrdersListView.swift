//
//  OrdersListView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct OrdersListView: View {
    @EnvironmentObject var navigationState: CreateOrderNavigationState
    @ObservedObject var viewModel: OrderListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.orders.isEmpty {
                Text(Strings.noActiveOrders)
            } else {
                List(viewModel.orders) { order in
                    navigationLink(for: order)
                }
                .alert(item: $viewModel.error) { error in
                    Alert(title: Text(error.title),
                          message: Text(error.message),
                          dismissButton: Alert.Button.cancel(Text(Strings.ok)))
                }
            }
            if viewModel.isWorking {
                ActivityIndicatorView(caption: Strings.loading)
            }
        }
        .onAppear { viewModel.load() }
    }
    
    private func navigationLink(for order: Order) -> some View {
        NavigationLink(
            destination: OrderDetailsView(viewModel: OrderDetailsViewModel(order: order))
                .environmentObject(navigationState)
                .navigationTitle(order.customerName),
//            isActive: $navigationState.isShownOrderDetails,
            label: {
                OrderCell(order: order)
            })
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView(viewModel: OrderListViewModel())
    }
}
