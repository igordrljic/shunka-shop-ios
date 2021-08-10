//
//  Color+Theme.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI
import UIKit

public extension Color {
    private static var theme: Theme {
        AppConfiguration.shared.theme
    }
    
    static var themePrimary: Color {
        theme.primary
    }
    static var themeAction: Color {
        theme.action
    }
    static var themeError: Color {
        theme.error
    }
    static var themeDisabled: Color {
        theme.disabled
    }
    static var themePrimaryText: Color {
        Color(UIColor.label)
    }
    static var themeSecondaryText: Color {
        Color(UIColor.secondaryLabel)
    }
    
    static var themeDefaultBackground: Color {
        Color(UIColor.systemBackground)
    }
}
