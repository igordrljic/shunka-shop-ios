//
//  AppConfigError.swift
//  shunka-shop
//
//  Created by Igor Drljic on 31/05/2021.
//

import Foundation

enum AppConfigError: LocalizedError {
    case infoPlistFileNotReadable
    case infoPlistDoesNotContain(key: String)
    
    var errorDescription: String? {
        switch self {
        case .infoPlistFileNotReadable:
            return "Info.plist file could not be read."
        case let .infoPlistDoesNotContain(key):
            return "Info.plist file does not contain: \(key)"
        }
    }
}
