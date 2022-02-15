//
//  HomeNavigationStateManager.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation
import Combine

class HomeNavigationState: ObservableObject {
    @Published var selectedTab: HomeView.Tabs = .orders
    
}

extension HomeNavigationState {
    func clear() {}
    
    func showOrdersList() {
        selectedTab = .orders
    }
    
    func showProductsList() {
        selectedTab = .products
    }
}
