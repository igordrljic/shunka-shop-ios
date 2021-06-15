//
//  SecureUnderlinedTextField.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import SwiftUI

struct SecureUnderlinedTextField: View {
    let placeholder: String
    @Binding var text: String
    @State var isTextHidden = true
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                ZStack {
                    SecureField(placeholder, text: $text)
                        .font(Font.system(.title3))
                        .frame(minHeight: 30, idealHeight: 30, maxHeight: 30)
                        .opacity(isTextHidden ? 1 : 0)
                        .disabled(!isTextHidden)
                    TextField(placeholder, text: $text)
                        .font(Font.system(.title3))
                        .frame(minHeight: 30, idealHeight: 30, maxHeight: 30)
                        .opacity(isTextHidden ? 0 : 1)
                        .disabled(isTextHidden)
                }
                Button(action: {
                    self.isTextHidden.toggle()
                }, label: {
                    Image(systemName: self.isTextHidden ? "eye.fill" : "eye.slash.fill")
                })
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.primary)
                .padding(.top, 4)
        }
    }
}
