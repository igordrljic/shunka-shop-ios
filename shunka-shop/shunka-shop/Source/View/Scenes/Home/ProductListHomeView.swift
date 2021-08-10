//
//  ProductListNavigationView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct ProductListHomeView: View {
    @StateObject var productListViewModel = ProductListViewModel()
    
    @State private var isCreateProductPresented = false
    
    var body: some View {
        NavigationView {
            ProductListView(viewModel: productListViewModel)
                .navigationBarTitle(Strings.mainTabItemProducts)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    trailing:
                    HStack(spacing: 16) {
                        Button(
                            action: { productListViewModel.reload() },
                            label: { Image(systemName: "arrow.counterclockwise") }
                        )
                        Button(
                            action: { isCreateProductPresented = true },
                            label: { Image(systemName: "plus") }
                        )
                        .fullScreenCover(isPresented: $isCreateProductPresented) {
                            createProductView
                        }
                    }
                )
        }
    }
    
    private var createProductView: some View {
        NavigationView {
            CreateProductView(viewModel: CreateProductViewModel(), isPresented: $isCreateProductPresented)
                .navigationBarTitle(Strings.registerProduct)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                        Button(
                            action: { isCreateProductPresented = false },
                            label: { Text(Strings.cancel) }
                        )
                )
        }
    }
}
