//
//  Parser.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

import Foundation

protocol ParserProtocol {
    func parse<T: Decodable>(_ data: Data, type: T.Type, decoder: JSONDecoder) -> T?
}

final class Parser: ParserProtocol {
    func parse<T: Decodable>(_ data: Data, type: T.Type, decoder: JSONDecoder = .init()) -> T? {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error \(error)")
        }
        return nil
    }
}
