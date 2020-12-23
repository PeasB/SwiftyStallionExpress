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
    case malformedRequest(String?)
    case notSecured
    case InternalError(String?)

    var description: String {
        switch self {
        case .error(let error):
            return error.localizedDescription
        case .InternalError(let message):
            return message ?? "unknown"
        case .malformedRequest(let message):
            return message ?? "unknown"
        default:
            return Mirror(reflecting: self).children.first?.label ?? "unknown"
        }
    }
}
