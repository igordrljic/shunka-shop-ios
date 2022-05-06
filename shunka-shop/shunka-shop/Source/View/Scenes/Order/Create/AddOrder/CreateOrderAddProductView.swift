//
//  CreateOrderAddProductView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 17.4.22..
//

import SwiftUI

struct CreateOrderAddProductView: View
{
    @EnvironmentObject var navigationState: CreateOrderNavigationState
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel)
    {
        log()
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View
    {
        formView()
    }
    
    private func formView() -> some View
    {
        return ScrollView
        {
            VStack(alignment: .leading, spacing: .zero)
            {
                Spacer().frame(height: EdgeInsets.padding_x2)
                
                selectProductButton()
                Spacer().frame(height: EdgeInsets.padding_x2)
                
                priceField()
                Spacer().frame(height: EdgeInsets.padding_x2)

                quantityField()
                Spacer().frame(height: EdgeInsets.padding_x2)
                
                saveButton()
            }
            .padding()
        }
    }
    
    private func selectProductButton() -> some View
    {
        return Button(viewModel.selectedProduct?.description ?? Strings.CreateOrder.selectProduct)
        {
            navigationState.presentSelectProduct()
        }
        .buttonStyle(FormSelectButtonStyle())
        .fullScreenCover(isPresented: $navigationState.isSelectProductPresented)
        {
            NavigationView
            {
                SingleSelectionList<Product>(viewModel: viewModel.productSelectionViewModel)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarTitle(Strings.CreateOrder.selectProduct)
                    .navigationBarItems(
                        trailing: Button(
                            action: {
                                viewModel.confirmProductSelection()
                                navigationState.dismissSelectProduct()
                            },
                            label: { Text(Strings.save) }
                        )
                    )
            }
        }
    }
    
    private func priceField() -> some View
    {
        return Group
        {
            Text(Strings.CreateOrder.priceFieldTitle)
            Spacer().frame(height: EdgeInsets.padding_half)
            ErrorTextField(
                placeholder: AmountFormatter.format(Int.zero),
                alignment: .leading,
                text: $viewModel.price,
                error: $viewModel.priceError
            )
        }
    }
    
    private func quantityField() -> some View
    {
        return Group
        {
            Text(Strings.CreateOrder.quantityFieldTitle)
            Spacer().frame(height: EdgeInsets.padding_half)
            ErrorTextField(
                placeholder: QuantityFormatter.format(Float.zero),
                alignment: .leading,
                text: $viewModel.quantity,
                error: $viewModel.quantityError
            )
        }
    }

    private func saveButton() -> some View
    {
        return Button(Strings.save)
        {
            viewModel.save
            {
                result in
                switch result
                {
                case .success:
                    navigationState.dismissAddProduct()
                case .failure(let error):
                    return
                }
            }
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

struct CreateOrderAddProductView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreateOrderAddProductView(viewModel: .init(products: []))
                .environmentObject(CreateOrderNavigationState())
        }
    }
}
