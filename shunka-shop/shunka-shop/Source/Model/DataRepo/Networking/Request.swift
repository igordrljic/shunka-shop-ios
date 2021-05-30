//
//  Request.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

typealias HTTPHeader = [String: String]
typealias Parameters = [String: Any]

struct Request<ResultType: Decodable> {
    let url: URL
    let httpMethod: HTTPMethod
    let httpHeader: HTTPHeader
    let parameters: Parameters?
    let encoding: ParameterEncoding?
    let parse: (Data?) throws -> ResultType
    
    init(url: URL,
         httpMethod: HTTPMethod,
         httpHeader: HTTPHeader = [:],
         parameters: Parameters? = nil,
         encoding: ParameterEncoding? = nil,
         parse: @escaping (Data?) throws -> ResultType) {
        self.url = url
        self.httpMethod = httpMethod
        self.httpHeader = httpHeader
        self.parameters = parameters
        self.encoding = encoding
        self.parse = parse
    }
}

extension Request {
    func urlRequest(encoding: ParameterEncoding) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = httpHeader
        return try encoding.encode(request, with: parameters)
    }
}
