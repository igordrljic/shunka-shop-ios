//
//  SingleSelectView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct SingleSelectionList<Object: Nameable>: View {
    @ObservedObject var viewModel: ViewModel
    let screenTitle: String
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.items, id: \.id) { item in
                SelectionItemView(item: item, isSelected: viewModel.isSelected(item.id)) { item in
                    self.viewModel.setSelected(item.id)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(screenTitle)
        }
    }
}

struct SingleSelectView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SingleSelectionList.ViewModel(objects: ["select 1", "select 2"], selectedItemIndex: 1) { object in
            debugPrint("selected object: \(String(describing: object))")
        }
        SingleSelectionList<String>(viewModel: viewModel, screenTitle: "Screen title")
    }
}
