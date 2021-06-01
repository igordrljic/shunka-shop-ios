//
//  UnderlinedTextField.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI

struct UnderlinedTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 4) {
            TextField(placeholder, text: $text)
                .font(Font.system(.title3))
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.primary)
        }
    }
}
