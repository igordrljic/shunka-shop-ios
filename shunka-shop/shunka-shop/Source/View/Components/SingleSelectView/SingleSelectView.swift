//
//  SingleSelectView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct SingleSelectView: View {
    @ObservedObject var viewModel: SingleSelectViewModel
    let screenTitle: String
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.items, id: \.id) { item in
                SingleSelectItemView(item: item)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(screenTitle)
        }
    }
}

struct SingleSelectView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [SelectViewItem(title: "select 1", isSelected: false),
                     SelectViewItem(title: "select 2", isSelected: true)]
        let viewModel = SingleSelectViewModel(items: items)
        SingleSelectView(viewModel: viewModel, screenTitle: "Screen title")
    }
}
