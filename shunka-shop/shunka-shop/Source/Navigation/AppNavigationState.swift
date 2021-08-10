//
//  NavigationStateManager.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Combine

extension AppNavigationState {
    enum Scene {
        case login
        case home
    }
}

class AppNavigationState: ObservableObject {
    static let shared = AppNavigationState()
    
    @Published private(set) var landingScene: Scene = .login
    
    let homeState = HomeNavigationState()
    let createOrderState = CreateOrderNavigationState()
    let createProductState = CreateProductNavigationState()
}

extension AppNavigationState {
    func clear() {
        createOrderState.clear()
        createProductState.clear()
        homeState.clear()
    }
    
    func presentLogin() {
        clear()
        landingScene = .login
    }
    
    func presentHome() {
        clear()
        landingScene = .home
    }
}
