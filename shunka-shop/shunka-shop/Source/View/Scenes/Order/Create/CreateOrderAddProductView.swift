//
//  CreateOrderAddProductView.swift
//  shunka-shop
//
//  Created by Igor Drljic on 17.4.22..
//

import SwiftUI

extension CreateOrderAddProductView
{
    class ViewModel: ObservableObject
    {
        struct Output
        {
            let product: Product
            let pricePerKg: Int
            let quantityInKg: Float
        }
        
        enum Field: Int, CaseIterable, Identifiable {
            case pricePerKilo
            case quantity
            
            typealias ID = Int
            var id: ID { rawValue }
        }
        
        let productSelectionViewModel: SingleSelectionList<Product>.ViewModel
        let products: [Product]
        
        private (set) var selectedProduct: Product?
        
        @Published var price: String = ""
        @Published var quantity: String = ""
        
        @Published var priceError: String?
        @Published var quantityError: String?
        
        init(products: [Product])
        {
            self.products = products
            self.productSelectionViewModel = .init(objects: products)
        }
        
        func confirmProductSelection()
        {
            productSelectionViewModel.confirmSelection()
            self.selectedProduct = productSelectionViewModel.selectedObject
        }
        
        func validate() -> Result<Output, Error>
        {
            
        }
    }
}

struct CreateOrderAddProductView: View {
    @EnvironmentObject var navigationState: CreateOrderNavigationState
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel)
    {
        self.viewModel = viewModel
    }
    
    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .leading, spacing: .zero)
            {
                
                Spacer().frame(height: EdgeInsets.padding_x2)
                
                selectProductButton()
                Spacer().frame(height: EdgeInsets.padding_x2)
                
                Text(Strings.CreateOrder.priceFieldTitle)
                Spacer().frame(height: EdgeInsets.padding_half)
                ErrorTextField(
                    placeholder: AmountFormatter.format(Int.zero),
                    alignment: .leading,
                    text: $viewModel.price,
                    error: $viewModel.priceError
                )
                Spacer().frame(height: EdgeInsets.padding_x2)

                Text(Strings.CreateOrder.quantityFieldTitle)
                Spacer().frame(height: EdgeInsets.padding_half)
                ErrorTextField(
                    placeholder: QuantityFormatter.format(Float.zero),
                    alignment: .leading,
                    text: $viewModel.quantity,
                    error: $viewModel.quantityError
                )
                Spacer().frame(height: EdgeInsets.padding_x2)
                
                Button(Strings.save)
                {
                    
                    navigationState.presentSelectProduct()
                }
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
        .buttonStyle(FormButtonStyle())
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
                            label: { Text(Strings.cancel) }
                        )
                    )
            }
        }
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
