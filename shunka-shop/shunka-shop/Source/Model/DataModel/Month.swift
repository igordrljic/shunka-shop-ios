//
//  Month.swift
//  shunka-shop
//
//  Created by Igor Drljic on 02/06/2021.
//

import Foundation

enum Month: Int, Codable {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
    
    var name: String {
        switch self {
        case .january:
            return Strings.january
        case .february:
            return Strings.february
        case .march:
            return Strings.march
        case .april:
            return Strings.april
        case .may:
            return Strings.may
        case .june:
            return Strings.june
        case .july:
            return Strings.july
        case .august:
            return Strings.august
        case .september:
            return Strings.september
        case .october:
            return Strings.october
        case .november:
            return Strings.november
        case .december:
            return Strings.december
        }
    }
}
