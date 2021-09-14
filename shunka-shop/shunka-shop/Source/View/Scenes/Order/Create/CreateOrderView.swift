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
                NavigationView {
                    SingleSelectionList<User>(viewModel: viewModel.customerSelectionViewModel)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarTitle(Strings.selectCustomer)
                        .navigationBarItems(
                            leading: Button(
                                action: { navigationState.dismissSelectCustomer() },
                                label: { Text(Strings.cancel) }
                            ),
                            trailing: Button(
                                action: {
                                    viewModel.customerSelectionViewModel.confirmSelection()
                                    navigationState.dismissSelectCustomer()
                                },
                                label: { Text(Strings.save) }
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

extension User: CustomStringConvertible {
    var description: String {
        "\(firstName) \(lastName)"
    }
}

struct CreateOrderView_Previews: PreviewProvider {
    static let viewModel = CreateOrderView.ViewModel()
    
    static var previews: some View {
        CreateOrderView(viewModel: CreateOrderView_Previews.viewModel)
            .environmentObject(AppNavigationState.shared.createOrderState)
    }
}
