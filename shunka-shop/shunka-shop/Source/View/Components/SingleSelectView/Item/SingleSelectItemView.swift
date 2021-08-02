//
//  SingleSelectItemView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct SingleSelectItemView: View {
    let item: SelectViewItem
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(item.title)
                if (item.isSelected) {
                    Spacer(minLength: 8)
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.themePrimary)
                }
            }
            Button("") {
                item.isSelected.toggle()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
