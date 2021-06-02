//
//  ActivityIndicatorView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct ActivityIndicatorView: View {
    let caption: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            ProgressView(caption)
                .foregroundColor(Color.primary)
                .progressViewStyle(
                    CircularProgressViewStyle(tint: Color.primary)
                )
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                )
        }
    }
}
