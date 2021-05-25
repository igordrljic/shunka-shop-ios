//
//  ContentView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 21/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView(viewModel: LoginViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
