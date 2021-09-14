//
//  SingleSelectionScreen.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct SingleSelectionScene<Object: CustomStringConvertible>: View {
    @ObservedObject var viewModel: SingleSelectionList<Object>.ViewModel
    let screenTitle: String
    
    var body: some View {
        NavigationView {
            SingleSelectionList<Object>(viewModel: viewModel)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(screenTitle)
        }
    }
}

struct SingleSelectionScene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SingleSelectionList.ViewModel(objects: ["select 1", "select 2"], selectedItemIndex: 1)
        SingleSelectionScene(viewModel: viewModel, screenTitle: Strings.selectCustomer)
    }
}
