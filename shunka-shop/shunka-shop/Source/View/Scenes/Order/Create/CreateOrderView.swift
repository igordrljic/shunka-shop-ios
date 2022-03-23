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
        VStack {
            selectCustomerButton()
            Spacer()
        }
        .onAppear(perform: {
            viewModel.load()
        })
        if viewModel.isWorking {
            ActivityIndicatorView(caption: Strings.loading)
        }
    }
    
    private func selectCustomerButton() -> some View {
        return Button(viewModel.selectedCustomer?.description ?? Strings.selectCustomer) {
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
                        trailing: Button(
                            action: {
                                viewModel.confirmCustomerSelection()
                                navigationState.dismissSelectCustomer()
                            },
                            label: { Text(Strings.save) }
                        )
                    )
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
