//
//  CreateOrderAddProductView+ViewModel.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25.4.22..
//

import Foundation

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
            log()
        }
        
        func confirmProductSelection()
        {
            productSelectionViewModel.confirmSelection()
            self.selectedProduct = productSelectionViewModel.selectedObject
            log(message: "\(self.selectedProduct)")
        }
        
        func save(completion: (Result<Void, Error>) -> Void)
        {
            do
            {
                let output = try validate()
                print(output)
                completion(.success(()))
            }
            catch
            {
                print(error)
                completion(.failure(error))
            }
        }
        
        func validate() throws -> Output
        {
            return .init(
                product: try Validation.validate(product: selectedProduct),
                pricePerKg: try Validation.validate(price: price),
                quantityInKg: try Validation.validate(quantity: quantity)
            )
        }
    }
}
