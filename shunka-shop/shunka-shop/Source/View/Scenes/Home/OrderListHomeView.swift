//
//  OrderListNavigationView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct OrderListHomeView: View {
    @EnvironmentObject var navigationState: CreateOrderNavigationState
    @StateObject var orderListViewModel = OrderListViewModel()
    @StateObject var createOrderViewModel = CreateOrderView.ViewModel()
    
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
                            action: { navigationState.presentCreateOrder() },
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
            CreateOrderView(viewModel: createOrderViewModel)
                .environmentObject(navigationState)
                .navigationBarTitle(Strings.CreateOrder.title)
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
