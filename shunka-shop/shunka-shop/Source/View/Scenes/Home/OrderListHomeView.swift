//
//  OrderListNavigationView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct OrderListHomeView: View {
    @EnvironmentObject var navigationState: HomeNavigationState
    @StateObject var orderListViewModel = OrderListViewModel()
    
    var body: some View {
        NavigationView {
            OrdersListView(viewModel: orderListViewModel)
                .navigationBarTitle(Strings.mainTabItemOrders)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing:
                    HStack(spacing: 16) {
                        Button(
                            action: { orderListViewModel.reload() },
                            label: { Image(systemName: "arrow.counterclockwise") }
                        )
                        Button(
                            action: { navigationState.showCreateOrder() },
                            label: { Image(systemName: "plus") }
                        )
                        .fullScreenCover(isPresented: $navigationState.isCreateOrderPresented) {
                            createOrderView
                        }
                    }
                )
        }
    }
    
    private var createOrderView: some View {
        NavigationView {
            CreateOrderView(isPresented: $navigationState.isCreateOrderPresented)
                .navigationBarTitle(Strings.createOrder)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                        Button(
                            action: { navigationState.dismissCreateOrder() },
                            label: { Text(Strings.cancel) }
                        )
                )
        }
    }
}
