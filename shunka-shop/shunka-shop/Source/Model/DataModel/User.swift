//
//  User.swift
//  shunka-shop
//
//  Created by Igor Drljic on 10.8.21..
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var geolocation: Geolocation
    var role: UserRole
    var username: String
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var address: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id", geolocation, role, username, firstName, lastName, email, phone, address
    }
}
