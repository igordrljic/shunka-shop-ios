//
//  OrderListNavigationView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct OrderListHomeView: View {
    @StateObject var orderListViewModel = OrderListViewModel()
    
    @State private var isCreateOrderPresented = false
    
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
                    }
                )
        }
    }
    
    private var createOrderView: some View {
        NavigationView {
            CreateOrderView(isPresented: $isCreateOrderPresented)
                .navigationBarTitle(Strings.registerProduct)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                        Button(
                            action: { isCreateOrderPresented = false },
                            label: { Text(Strings.cancel) }
                        )
                )
        }
    }
}
