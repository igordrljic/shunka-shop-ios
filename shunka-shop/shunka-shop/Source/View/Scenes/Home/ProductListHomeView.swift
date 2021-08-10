//
//  ProductListNavigationView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import SwiftUI

struct ProductListHomeView: View {
    @EnvironmentObject var navigationState: CreateProductNavigationState
    @StateObject var productListViewModel = ProductListViewModel()
    
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
                            action: { navigationState.presentCreateProduct() },
                            label: { Image(systemName: "plus") }
                        )
                        .fullScreenCover(isPresented: $navigationState.isCreateProductPresented) {
                            createProductView
                        }
                    }
                )
        }
    }
    
    private var createProductView: some View {
        NavigationView {
            CreateProductView(
                viewModel: CreateProductViewModel(),
                isPresented: $navigationState.isCreateProductPresented
            )
                .navigationBarTitle(Strings.registerProduct)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                        Button(
                            action: { navigationState.dismissCreateProduct() },
                            label: { Text(Strings.cancel) }
                        )
                )
        }
    }
}
