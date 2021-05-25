//
//  LoginView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 21/05/2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 30) {
                Group {
                    ErrorUnderlinedTextField(placeholder: Strings.username,
                                             text: $viewModel.username,
                                             error: $viewModel.usernameError)
                    ErrorUnderlinedTextField(placeholder: Strings.password,
                                             text: $viewModel.password,
                                             error: $viewModel.passwordError)
                }.autocapitalization(.none)
            }
            Button(Strings.login) {
                debugPrint("username: \(self.viewModel.username)\npassword: \(self.viewModel.password)")
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(!viewModel.isFormValid)
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView(viewModel: LoginViewModel())
                .preferredColorScheme(.light)
            LoginView(viewModel: LoginViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
