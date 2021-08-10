//
//  ContentView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigator: NavigationStateManager
    
    var body: some View {
        switch navigator.landingScene {
        case .login:
            LoginView()
        case .home:
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NavigationStateManager.shared)
    }
}
