//
//  ContentView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationState: AppNavigationState
    
    var body: some View {
        switch navigationState.landingScene {
        case .login:
            LoginView()
        case .home:
            HomeView().environmentObject(navigationState.homeState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppNavigationState.shared)
    }
}
