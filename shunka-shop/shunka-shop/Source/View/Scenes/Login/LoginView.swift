//
//  LoginView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 21/05/2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                VStack(spacing: 30) {
                    Group {
                        ErrorTextField(placeholder: Strings.username,
                                       alignment: .leading,
                                       text: $viewModel.username,
                                       error: $viewModel.usernameError)
                        SecureErrorTextField(placeholder: Strings.password,
                                             text: $viewModel.password,
                                             error: $viewModel.passwordError)
                    }.autocapitalization(.none)
                    .disableAutocorrection(true)
                }
                Button(Strings.login) {
                    viewModel.login()
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(!viewModel.isFormValid)
            }
            .padding()
            .alert(item: $viewModel.error) { error in
                Alert(title: Text(error.title),
                      message: Text(error.message),
                      dismissButton: Alert.Button.cancel(Text(Strings.ok)))
            }
            if viewModel.isWorking {
                ActivityIndicatorView(caption: Strings.loggingIn)
            }
        }
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
