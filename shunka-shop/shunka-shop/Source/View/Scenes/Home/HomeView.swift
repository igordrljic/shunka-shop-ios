//
//  MainTabView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationState: HomeNavigationState
    
    var body: some View {
        TabView(selection: $navigationState.selectedTab) {
            OrderListHomeView()
                .environmentObject(AppNavigationState.shared.createOrderState)
                .tag(Tabs.orders)
                .tabItem {
                    Label(Strings.mainTabItemOrders, systemImage: "shippingbox")
                }
            ProductListHomeView()
                .environmentObject(navigationState)
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
