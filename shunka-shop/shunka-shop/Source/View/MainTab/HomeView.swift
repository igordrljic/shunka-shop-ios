//
//  MainTabView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct HomeView: View {
    @StateObject var productListViewModel = ProductListViewModel()
    @StateObject var orderListViewModel = OrderListViewModel()
    @State private var isCreateProductPresented = false
    
    var body: some View {
        TabView {
            NavigationView {
                OrdersListView(viewModel: orderListViewModel)
                    .navigationBarTitle(Strings.mainTabItemOrders)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label(Strings.mainTabItemOrders,
                      systemImage: "shippingbox")
            }
            NavigationView {
                productListView
            }
            .tabItem {
                Label(Strings.mainTabItemProducts,
                      systemImage: "bag")
            }
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
                    .fullScreenCover(
                        isPresented: $isCreateProductPresented,
                        content: {
                            createProductView
                        }
                    )
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
