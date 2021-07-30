//
//  PrimaryButtonStyle.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        PrimaryButton(configuration: configuration)
    }
}

private extension PrimaryButtonStyle {
    
    struct PrimaryButton: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: PrimaryButtonStyle.Configuration
        
        var body: some View {
            configuration.label
                .padding()
                .frame(maxWidth: .infinity)
                .font(Font.system(.body))
                .background(isEnabled ? Color.primary : Color.disabled)
                .foregroundColor(Color.action)
                .opacity(configuration.isPressed ? 0.6 : 1)
                .clipShape(Capsule())
        }
    }
}
