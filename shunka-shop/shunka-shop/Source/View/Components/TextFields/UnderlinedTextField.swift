//
//  UnderlinedTextField.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI

struct UnderlinedTextField: View {
    let placeholder: String
    let alignment: TextAlignment
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 4) {
            TextField(placeholder, text: $text)
                .font(Font.system(.body))
                .multilineTextAlignment(alignment)
                .frame(minHeight: 30, idealHeight: 30, maxHeight: 30)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.themePrimary)
                .padding(.top, 4)
        }
    }
}
