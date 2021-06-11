//
//  Network.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation
import Combine

class Network {
    static let shared = Network()
    let urlSession: URLSession = URLSession.shared
    private (set) var subscribers = [URLRequest: AnyCancellable]()
    
    func run<ResultType>(_ request: Request<ResultType>, completion: @escaping (Result<ResultType, Error>) -> Void) {
        do {
            var urlRequest: URLRequest
            if let encoding = request.encoding {
                urlRequest = try request.urlRequest(encoding: encoding)
            } else {
                urlRequest = URLRequest(url: request.url)
            }
            urlRequest.allHTTPHeaderFields = request.httpHeader
            urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            subscribers[urlRequest] = urlSession.dataTaskPublisher(for: urlRequest)
                .retry(1)
                .tryMap({ data, response -> ResultType in
                    guard let httpResponse = response as? HTTPURLResponse,
                          (200...299).contains(httpResponse.statusCode) else {
                        throw WebserviceError.wrappedData(data: data)
                    }
                    return try request.decoding.decode(data)
                })
                .receive(on: DispatchQueue.main)
                .sink { subscribersCompletion in
                    if case let .failure(error) = subscribersCompletion {
                        completion(.failure(error))
                        self.subscribers.removeValue(forKey: urlRequest)
                    }
                } receiveValue: { result in
                    completion(.success(result))
                    self.subscribers.removeValue(forKey: urlRequest)
                }
        } catch {
            completion(.failure(error))
        }
    }
}
