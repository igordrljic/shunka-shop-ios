//
//  shunka_shopApp.swift
//  shunka-shop
//
//  Created by Igor Drljic on 21/05/2021.
//

import SwiftUI

@main
struct shunka_shopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(NavigationStateManager.shared)
        }
    }
}
