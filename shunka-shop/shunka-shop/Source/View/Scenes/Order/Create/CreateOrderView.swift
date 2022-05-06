//
//  CreateOrderView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 2.8.21..
//

import SwiftUI

struct CreateOrderView: View {
    @EnvironmentObject var navigationState: CreateOrderNavigationState
    @StateObject private var viewModel: ViewModel

    @State private var isLoaded = false
    
    init(viewModel: ViewModel) {
        log()
        _viewModel = StateObject(wrappedValue: viewModel)
        viewModel.load()
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: .zero)
                {
                    
                    Spacer().frame(height: EdgeInsets.padding_x2)
                    
                    HStack
                    {
                        Spacer().frame(width: EdgeInsets.padding)
                        Text(Strings.CreateOrder.customer)
                    }
                    selectCustomerButton()
                    Spacer().frame(height: EdgeInsets.padding)
                    
                    HStack
                    {
                        Spacer().frame(width: EdgeInsets.padding)
                        Text(Strings.CreateOrder.products)
                    }
                    addProductButton()
                    Spacer().frame(height: EdgeInsets.padding)
                    
                    shippingDatePicker()
                    Spacer().frame(height: EdgeInsets.padding)
                    
                }
            }
            
            if viewModel.isWorking {
                ActivityIndicatorView(caption: Strings.loading)
            }
        }
    }
    
    private func selectCustomerButton() -> some View
    {
        return Button(viewModel.selectedCustomer?.description ?? Strings.CreateOrder.selectCustomer)
        {
            navigationState.presentSelectCustomer()
        }
        .buttonStyle(FormSelectButtonStyle())
        .padding(.formButton)
        .fullScreenCover(isPresented: $navigationState.isSelectCustomerPresented)
        {
            NavigationView
            {
                SingleSelectionList<User>(viewModel: viewModel.customerSelectionViewModel)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle(Strings.CreateOrder.selectCustomer)
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
    
    private func shippingDatePicker() -> some View {
        return DatePicker(
            Strings.CreateOrder.shippingDate,
            selection: Binding<Date>(
                get: {
                    viewModel.selectedShippingDate ?? Date()
                },
                set: {
                    newValue in viewModel.selectedShippingDate = newValue
                }
            ),
            displayedComponents: [.date]
        )
        .padding(.formItem)
    }
    
    private func addProductButton() -> some View {
        return Button(Strings.CreateOrder.addProduct) {
            navigationState.presentAddProduct()
        }
        .buttonStyle(FormSelectButtonStyle())
        .padding()
        .fullScreenCover(isPresented: $navigationState.isAddProductPresented) {
            NavigationView {
                CreateOrderAddProductView(viewModel: .init(products: viewModel.products))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle(Strings.CreateOrder.addProduct)
                    .navigationBarItems(
                        trailing: Button(
                            action: {
                                navigationState.dismissAddProduct()
                            },
                            label: { Text(Strings.cancel) }
                        )
                    )
                    .environmentObject(navigationState)
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
