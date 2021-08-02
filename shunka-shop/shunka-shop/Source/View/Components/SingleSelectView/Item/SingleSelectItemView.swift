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
        HStack(alignment: .center) {
            Text(item.title)
            if (item.isSelected) {
                Spacer(minLength: 8)
                Image(systemName: "checkmark.circle.fill").foregroundColor(.themePrimary)
            }
        }
    }
}
