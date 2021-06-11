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
    let requestRetryCount: Int = 1
    let completionQueue: DispatchQueue = .main
    private (set) var subscribers = [Request: AnyCancellable]()
    
    func run<ResultType: Decodable>(_ request: Request, completion: @escaping (Result<ResultType, Error>) -> Void) {
        do {
            let urlRequest = try map(request)
            subscribers[request] = urlSession.dataTaskPublisher(for: urlRequest)
                .retry(requestRetryCount)
                .tryMap({ data, response -> ResultType in
                    try self.validate(response, data)
                    return try request.decoding.decode(data)
                })
                .receive(on: completionQueue)
                .sink { subscribersCompletion in
                    if case let .failure(error) = subscribersCompletion {
                        completion(.failure(error))
                        self.subscribers.removeValue(forKey: request)
                    }
                } receiveValue: { result in
                    completion(.success(result))
                    self.subscribers.removeValue(forKey: request)
                }
        } catch {
            completion(.failure(error))
        }
    }
    
    func run(_ request: Request, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let urlRequest = try map(request)
            subscribers[request] = urlSession.dataTaskPublisher(for: urlRequest)
                .retry(requestRetryCount)
                .tryMap({ data, response -> Void in
                    try self.validate(response, data)
                    return ()
                })
                .receive(on: completionQueue)
                .sink { subscribersCompletion in
                    if case let .failure(error) = subscribersCompletion {
                        completion(.failure(error))
                        self.subscribers.removeValue(forKey: request)
                    }
                } receiveValue: { result in
                    completion(.success(result))
                    self.subscribers.removeValue(forKey: request)
                }
        } catch {
            completion(.failure(error))
        }
    }
    
    private func map(_ request: Request) throws -> URLRequest {
        var urlRequest: URLRequest
        if let encoding = request.encoding {
            urlRequest = try request.urlRequest(encoding: encoding)
        } else {
            urlRequest = URLRequest(url: request.url)
        }
        urlRequest.allHTTPHeaderFields = request.httpHeader
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return urlRequest
    }
    
    private func validate(_ response: URLResponse, _ data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw WebserviceError.wrappedData(data: data)
        }
    }
}