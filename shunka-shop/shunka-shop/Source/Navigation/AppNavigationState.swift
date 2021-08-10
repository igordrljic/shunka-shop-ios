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
    
    let homeState: HomeNavigationState = HomeNavigationState()
    
    func showLogin() {
        landingScene = .login
    }
    
    func showHome() {
        landingScene = .home
    }
}
