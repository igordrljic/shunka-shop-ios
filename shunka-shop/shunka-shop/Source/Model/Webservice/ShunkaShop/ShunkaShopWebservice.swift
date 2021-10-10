//
//  ShunkaShopWebservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

class ShunkaShop: Webservice {
    static let shared = ShunkaShop()
    let baseUrl: URL = AppConfiguration.shared.shunkaShopBaseUrl
    let decoding: ResponseDecoding = JSONDecoding()
    private (set) var headers: HTTPHeader = [:]
    private let network: Network
        
    func set(authenticationToken token: String) {
        headers["x-auth-token"] = token
    }
    
    init(network: Network = Network.shared) {
        self.network = network
    }
    
    func run<ResultType: Decodable>(_ request: Request, completion: @escaping (Result<ResultType, Error>) -> Void) {
        network.run(request) { (result: Result<ResultType, Error>) in
            if case let .failure(error) = result {
                completion(.failure(self.map(error)))
            } else {
                completion(result)
            }
        }
    }
    
    func run(_ request: Request, completion: @escaping (Result<Void, Error>) -> Void) {
        network.run(request) { (result: Result<Void, Error>) in
            if case let .failure(error) = result {
                completion(.failure(self.map(error)))
            } else {
                completion(result)
            }
        }
    }
    
    private func map(_ error: Error) -> Error {
        if case let WebserviceError.wrappedData(data: data) = error,
           let shunkaShopError = ShunkaShopWebserviceError(data: data) {
            return shunkaShopError
        } else {
            return WebserviceError.general
        }
    }
}
