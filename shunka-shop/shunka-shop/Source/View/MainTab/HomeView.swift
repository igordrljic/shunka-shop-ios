//
//  MainTabView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            OrdersListView()
                .tabItem {
                    Label(Strings.mainTabItemOrders,
                          systemImage: "shippingbox")
                }
            ProductListView(viewModel: ProductListViewModel())
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
