//
//  MainTabView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct HomeView: View {
    enum Tabs: Int {
        case orders = 1
        case products = 2
    }
    
    @StateObject var productListViewModel = ProductListViewModel()
    @StateObject var orderListViewModel = OrderListViewModel()
    @State private var isCreateProductPresented = false
    @State private var isCreateOrderPresented = false
    @State private var selectedTab: Tabs = .orders
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                orderListView
            }
            .tag(Tabs.orders)
            .tabItem {
                Label(Strings.mainTabItemOrders, systemImage: "shippingbox")
            }
            NavigationView {
                productListView
            }
            .tag(Tabs.products)
            .tabItem {
                Label(Strings.mainTabItemProducts, systemImage: "bag")
            }
        }
    }
    
    private var orderListView: some View {
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
    
    private var productListView: some View {
        ProductListView(viewModel: productListViewModel)
            .navigationBarTitle(Strings.mainTabItemProducts)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                HStack(spacing: 16) {
                    Button(
                        action: { productListViewModel.reload() },
                        label: { Image(systemName: "arrow.counterclockwise") }
                    )
                    Button(
                        action: { isCreateProductPresented = true },
                        label: { Image(systemName: "plus") }
                    )
                    .fullScreenCover(isPresented: $isCreateProductPresented) {
                        createProductView
                    }
                }
            )
    }
    
    private var createProductView: some View {
        NavigationView {
            CreateProductView(viewModel: CreateProductViewModel(), isPresented: $isCreateProductPresented)
                .navigationBarTitle(Strings.registerProduct)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                        Button(
                            action: { isCreateProductPresented = false },
                            label: { Text(Strings.cancel) }
                        )
                )
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
