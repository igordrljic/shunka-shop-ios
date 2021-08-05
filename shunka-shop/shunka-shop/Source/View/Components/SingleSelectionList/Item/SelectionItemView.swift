//
//  SingleSelectItemView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct SelectionItemView: View {
    let item: SelectViewItem
    let isSelected: Bool
    let selectionHandler: (SelectViewItem) -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(item.title)
                if (isSelected) {
                    Spacer(minLength: 8)
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.themePrimary)
                }
            }
            Button("") {
                self.selectionHandler(item)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
