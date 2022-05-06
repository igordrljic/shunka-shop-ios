//
//  FormButtonStyle.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct FormSelectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        FormSelectButton(configuration: configuration)
    }
}

private extension FormSelectButtonStyle {
    struct FormSelectButton: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: FormSelectButtonStyle.Configuration
        
        var body: some View {
            configuration.label
                .padding(.formButton)
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
