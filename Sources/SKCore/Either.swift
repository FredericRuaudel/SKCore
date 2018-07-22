//
//  Either.swift
//  SKCore
//
//  Created by Frédéric Ruaudel on 22/07/2018.
//

import Foundation

public enum Either<L, R> {
    case left(L)
    case right(R)
}

extension Either: Decodable where L: Decodable, R: Decodable {
    public init(from decoder: Decoder) throws {
        do {
            self = try .left(.init(from: decoder))
        } catch {
            self = try .right(.init(from: decoder))
        }
    }
}

extension Either: Encodable where L: Encodable, R: Encodable {
    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .left(l):
            try l.encode(to: encoder)
        case let .right(r):
            try r.encode(to: encoder)
        }
    }
}
