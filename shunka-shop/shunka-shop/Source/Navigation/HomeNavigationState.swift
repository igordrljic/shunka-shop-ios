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
    @Published var isCreateProductPresented = false
}

extension HomeNavigationState {
    func showOrdersList() {
        selectedTab = .orders
    }
    
    func showProductsList() {
        selectedTab = .products
    }
    
    func showCreateProduct() {
        showProductsList()
        isCreateProductPresented = true
    }
    
    func dismissCreateProduct() {
        isCreateProductPresented = false
    }
}
