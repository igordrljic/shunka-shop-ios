//
//  CreateOrderView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct CreateOrderView: View {
    @EnvironmentObject var navigationState: CreateOrderNavigationState
        
    var body: some View {
        Button(Strings.selectCustomer) {
            navigationState.presentSelectCustomer()
        }
        .buttonStyle(FormButtonStyle())
        .padding()
        .fullScreenCover(isPresented: $navigationState.isSelectCustomerPresented) {
            let customers = ["Musterija Punoparic", "Kupovko Jeftinic", "Musterko Popustic"]
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
    }
}

struct CreateOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateOrderView().environmentObject(AppNavigationState.shared.createOrderState)
    }
}
