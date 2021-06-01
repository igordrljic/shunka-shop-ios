//
//  UseCase.swift
//  shunka-shop
//
//  Created by Igor Drljic on 01/06/2021.
//

import Foundation

protocol UseCase {
    associatedtype InputType
    associatedtype OutputType
    
    func execute(input: InputType, completion: @escaping (Result<OutputType, Error>) -> Void)
}
