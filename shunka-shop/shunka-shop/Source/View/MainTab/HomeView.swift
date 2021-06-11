//
//  MainTabView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct HomeView: View {
    @StateObject var productListViewModel = ProductListViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                OrdersListView()
                    .navigationBarTitle(Strings.mainTabItemOrders)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label(Strings.mainTabItemOrders,
                      systemImage: "shippingbox")
            }
            NavigationView {
                ProductListView(viewModel: productListViewModel)
                    .navigationBarTitle(Strings.mainTabItemProducts)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                productListViewModel.reload()
                    }, label: {
                        Image(systemName: "arrow.counterclockwise")
                    }))
            }
            .tabItem {
                Label(Strings.mainTabItemProducts,
                      systemImage: "bag")
            }
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
