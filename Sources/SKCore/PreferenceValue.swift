//
//  PreferenceValue.swift
//  SKCore
//
//  Created by Frédéric Ruaudel on 28/07/2018.
//

import Foundation

public enum PreferenceValue: Codable {
    case bool(Bool)
    case string(String)
    case number(Int)
    indirect case array([PreferenceValue])
    
    public init(from decoder: Decoder) throws {
        let valueContainer = try decoder.singleValueContainer()
        if let value = try? valueContainer.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? valueContainer.decode(String.self) {
            self = .string(value)
        } else if let value = try? valueContainer.decode(Int.self) {
            self = .number(value)
        } else if let values = try? valueContainer.decode([PreferenceValue].self) {
            self = .array(values)
        } else {
            throw DecodingError.typeMismatch(Any.self, DecodingError.Context(codingPath: [], debugDescription: "Value should be a bool, a string or an int"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var valueContainer = encoder.singleValueContainer()
        switch self {
        case let .bool(value):
            try valueContainer.encode(value)
        case let .string(value):
            try valueContainer.encode(value)
        case let .number(value):
            try valueContainer.encode(value)
        case let .array(value):
            try valueContainer.encode(value)
        }
    }
}
