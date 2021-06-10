//
//  UserSession.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

class UserSession: ObservableObject {
    static let shared = UserSession()
    @Published var isLoggedIn = false
    
    private init() {}
}
