//
//  Theme.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI

protocol Theme {
    var primary: Color { get }
    var action: Color { get }
    var error: Color { get }
    var disabled: Color { get }
}
