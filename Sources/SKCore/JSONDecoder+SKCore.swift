//
//  JSONDecoder+SKCore.swift
//  SKCore
//
//  Created by Frédéric Ruaudel on 27/07/2018.
//

import Foundation

extension JSONDecoder {
    static var JSONSKCoreDecoder: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }
}
