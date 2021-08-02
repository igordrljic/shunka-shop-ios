//
//  SecureErrorTextField.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import SwiftUI

struct SecureErrorTextField: View {
    let placeholder: String
    @Binding var text: String
    @Binding var error: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            SecureUnderlinedTextField(placeholder: placeholder, text: $text)
            if let error = error, !error.isEmpty {
                Text(error)
                    .foregroundColor(.themeError)
                    .font(Font.system(.footnote))
            }
        }
    }
}
