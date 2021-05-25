//
//  Color+Theme.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI

public extension Color {
    private static var theme: Theme {
        AppConfiguration.shared.theme
    }
    
    static var primary: Color {
        theme.primary
    }
    static var action: Color {
        theme.action
    }
    static var error: Color {
        theme.error
    }
    static var disabled: Color {
        theme.disabled
    }
}
