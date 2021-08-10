//
//  CreateOrderView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct CreateOrderView: View {
    @EnvironmentObject var navigationState: CreateOrderNavigationState
    @ObservedObject private(set) var viewModel: ViewModel
    
    @State private var isLoaded = false
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Button(Strings.selectCustomer) {
                navigationState.presentSelectCustomer()
            }
            .buttonStyle(FormButtonStyle())
            .padding()
            .fullScreenCover(isPresented: $navigationState.isSelectCustomerPresented) {
                let customers = viewModel.customers.map({ "\($0.firstName) \($0.lastName)" })
                let viewModel = SingleSelectionList<String>.ViewModel(objects: customers) { selectedCustomer in
                    debugPrint("selectedCustomer: \(selectedCustomer)")
                }
                NavigationView {
                    SingleSelectionList<String>(viewModel: viewModel)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarTitle(Strings.selectCustomer)
                        .navigationBarItems(trailing:
                            Button(
                                action: { navigationState.dismissSelectCustomer() },
                                label: { Text(Strings.cancel) }
                            )
                        )
                }
            }
            .onAppear(perform: {
                viewModel.load()
            })
            if viewModel.isWorking {
                ActivityIndicatorView(caption: Strings.loading)
            }
        }
    }
}

struct CreateOrderView_Previews: PreviewProvider {
    static let viewModel = CreateOrderView.ViewModel()
    
    static var previews: some View {
        CreateOrderView(viewModel: CreateOrderView_Previews.viewModel)
            .environmentObject(AppNavigationState.shared.createOrderState)
    }
}
