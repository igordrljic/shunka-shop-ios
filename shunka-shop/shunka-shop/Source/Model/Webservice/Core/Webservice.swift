//
//  Webservice.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

protocol Webservice {
    var baseUrl: URL { get }
    var decoding: ResponseDecoding { get }
    
    func run<ResultType: Decodable>(_ request: Request, completion: @escaping (Result<ResultType, Error>) -> Void)
    func run(_ request: Request, completion: @escaping (Result<Void, Error>) -> Void)
}
