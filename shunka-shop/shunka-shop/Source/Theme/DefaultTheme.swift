//
//  DefaultTheme.swift
//  shunka-shop
//
//  Created by Igor Drljic on 24/05/2021.
//

import SwiftUI

class DefaultTheme: Theme {
    var primary: Color {
        .blue
    }
    var action: Color {
        .white
    }
    var error: Color {
        .red
    }
    var disabled: Color {
        Color(red: 180/255, green: 180/255, blue: 180/255)
    }
}
