//
//  ErrorUnderlinedTextField.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI

struct ErrorTextField: View {
    let placeholder: String
    let alignment: TextAlignment
    @Binding var text: String
    @Binding var error: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            UnderlinedTextField(placeholder: placeholder, alignment: alignment, text: $text)
            if !(error?.isEmpty ?? true) {
                Text(error!)
                    .foregroundColor(.themeError)
                    .font(Font.system(.footnote))
            }
        }
    }
}
