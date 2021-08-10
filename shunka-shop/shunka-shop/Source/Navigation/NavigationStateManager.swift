//
//  NavigationStateManager.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Combine

class NavigationStateManager: ObservableObject {
    enum Scene {
        case login
        case home
    }

    static let shared = NavigationStateManager()
    
    @Published private(set) var landingScene: Scene = .login
    
    func showLogin() {
        landingScene = .login
    }
    
    func showHome() {
        landingScene = .home
    }
}
