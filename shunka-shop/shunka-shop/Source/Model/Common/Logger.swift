//
//  Logger.swift
//  shunka-shop
//
//  Created by Igor Drljic on 25.4.22..
//

import Foundation

func log(message: String = "", file: StaticString = #file, function: StaticString = #function)
{
    let fileString: String = file.withUTF8Buffer
    {
        String(decoding: $0, as: UTF8.self)
    }
    let fileName = fileString.split(separator: "/").last
    print("\(fileName ?? "no file name") - \(function): \(message)")
}
