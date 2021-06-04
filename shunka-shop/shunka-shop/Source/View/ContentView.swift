//
//  ContentView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        if userSession.isLoggedIn {
            HomeView()
        } else {
            LoginView(viewModel: LoginViewModel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
