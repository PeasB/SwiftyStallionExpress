//
//  APIError.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//

import Foundation

enum APIError: CustomStringConvertible {
    case error(Error)
    case noData
    case malformedRequest
    case notSecured

    var description: String {
        switch self {
        case .error(let error):
            return error.localizedDescription
        default:
            return Mirror(reflecting: self).children.first?.label ?? "unknown"
        }
    }
}
