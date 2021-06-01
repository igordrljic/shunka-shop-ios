//
//  AppConfiguration.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import Foundation

class AppConfiguration {
    static let shared = AppConfiguration()
    let theme: Theme
    let shunkaShopBaseUrl: URL
    
    init(theme: Theme = DefaultTheme()) {
        self.theme = theme
        
        guard let info = Bundle.main.infoDictionary else {
            fatalError(AppConfigError.infoPlistFileNotReadable.localizedDescription)
        }
        guard let shunksShopBasePath = info["ShunkaShopBasePath"] as? String,
              let shunksShopBaseURL = URL(string: shunksShopBasePath) else {
            fatalError(AppConfigError.infoPlistDoesNotContain(key: "ShunkaShopBasePath").localizedDescription)
        }
        self.shunkaShopBaseUrl = shunksShopBaseURL
    }
}
