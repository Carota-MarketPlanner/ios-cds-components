//
//  CDSPropertie.swift
//  CDSComponents
//
//  Created by Elias Ferreira on 22/04/26.
//

public protocol CDSPropertie {
    var properties: [String: Any] { get }
}

public extension CDSPropertie {
    func getPropertie<T>(field: String, ofType: T.Type) -> T {
        if let value = properties[field] as? T {
            return value
        }
        fatalError("No value for \(field)")
    }
}
