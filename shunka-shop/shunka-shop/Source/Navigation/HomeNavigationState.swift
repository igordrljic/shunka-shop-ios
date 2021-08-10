//
//  HomeNavigationStateManager.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation

class HomeNavigationState: ObservableObject {
    @Published var selectedTab: HomeView.Tabs = .orders
    @Published var isCreateProductPresented = false
    @Published var isCreateOrderPresented = false
    
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
    
    func showCreateOrder() {
        showOrdersList()
        isCreateOrderPresented = true
    }
    
    func dismissCreateOrder() {
        isCreateOrderPresented = false
    }
}
