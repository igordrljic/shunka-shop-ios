//
//  WebserviceError.swift
//  shunka-shop
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation

enum WebserviceError: Error {
    case wrappedData(data: Data)
    case noHTTPMethodSet(request: URLRequest)
    case noURL(request: URLRequest)
    case jsonEncodingFailed(error: Error)
    case responseParsingFailed(error: Error)
    case responseContainsNoData
}
