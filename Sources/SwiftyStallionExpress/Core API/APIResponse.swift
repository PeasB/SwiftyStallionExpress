//
//  APIResponse.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//

import Foundation

enum APIResponse<T: APIResource> {
    case resource(T)
    case error(APIError)
}
