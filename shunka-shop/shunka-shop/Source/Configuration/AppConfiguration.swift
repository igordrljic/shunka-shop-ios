//
//  AppConfiguration.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

class AppConfiguration {
    static let shared = AppConfiguration()
    let theme: Theme
    
    init(theme: Theme = DefaultTheme()) {
        self.theme = theme
    }
}
