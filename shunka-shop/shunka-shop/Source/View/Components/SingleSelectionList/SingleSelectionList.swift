//
//  SingleSelectView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct SingleSelectionList<Object: CustomStringConvertible>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var searchText = ""
    
    var body: some View {
        List(viewModel.items, id: \.id) { item in
            SelectionItemView(item: item, isSelected: item.id == viewModel.selectedItemId) { item in
                self.viewModel.setSelected(item.id)
            }
        }
    }
}

struct SingleSelectView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SingleSelectionList.ViewModel(objects: ["select 1", "select 2"], selectedItemIndex: 1)
        SingleSelectionList<String>(viewModel: viewModel)
    }
}
