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
    
    @State private var selectedTab: Tabs = .orders
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OrderListHomeView()
            .tag(Tabs.orders)
            .tabItem {
                Label(Strings.mainTabItemOrders, systemImage: "shippingbox")
            }
            ProductListHomeView()
            .tag(Tabs.products)
            .tabItem {
                Label(Strings.mainTabItemProducts, systemImage: "bag")
            }
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
