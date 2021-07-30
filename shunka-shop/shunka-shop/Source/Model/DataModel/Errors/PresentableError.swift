//
//  PresentableError.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

struct PresentableError: Identifiable {
    let id: UUID = UUID()
    let title: String = Strings.error
    let message: String
}
