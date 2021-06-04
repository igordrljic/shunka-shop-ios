//
//  ProductListView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel
    
    var body: some View {
        Group {
            if viewModel.products.isEmpty {
                Text(Strings.noProducts)
            } else {
                ZStack {
                    List(viewModel.products) { product in
                        ProductCell(product: product)
                    }
                    .alert(item: $viewModel.error) { error in
                        Alert(title: Text(error.title),
                              message: Text(error.message),
                              dismissButton: Alert.Button.cancel(Text(Strings.ok)))
                    }
                    if viewModel.isWorking {
                        ActivityIndicatorView(caption: Strings.loading)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.load()
        })
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewModel: ProductListViewModel())
    }
}
