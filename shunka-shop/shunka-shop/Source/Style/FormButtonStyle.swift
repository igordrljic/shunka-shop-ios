//
//  FormButtonStyle.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct FormButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        FormButton(configuration: configuration)
    }
}

private extension FormButtonStyle {
    struct FormButton: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: FormButtonStyle.Configuration
        
        var body: some View {
            configuration.label
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(Font.system(.body))
                .background(Color.themeDefaultBackground)
                .foregroundColor(isEnabled ? Color.themePrimary : Color.themeDisabled)
                .opacity(configuration.isPressed ? 0.6 : 1)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}
