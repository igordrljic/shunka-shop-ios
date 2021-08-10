//
//  NavigationStateManager.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Combine

class AppNavigationState: ObservableObject {
    enum Scene {
        case login
        case home
    }

    static let shared = AppNavigationState()
    
    @Published private(set) var landingScene: Scene = .login
    
    private(set) var homeState: HomeNavigationState = HomeNavigationState()
    
    func showLogin() {
        landingScene = .login
    }
    
    func showHome() {
        landingScene = .home
    }
}
