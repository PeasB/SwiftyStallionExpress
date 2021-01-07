//
//  APIRequest.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

protocol APIRequest {
    associatedtype APIResourceType: APIResource

    var path: String { get }
    var method: HTTPMethod { get }
    var contentType: String { get }

    var query: String? { get }

    func body() -> Data?
    func request(api: API) -> URLRequest?
}

extension APIRequest {

    var contentType: String {
        return "application/json"
    }

    var query: String? {
        return nil
    }

    func body() -> Data? {
        return nil
    }

    func request(api: API) -> URLRequest? {
        var components = URLComponents(string: api.baseURL)
        components?.path += path
        components?.query = query

        guard let url = components?.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body()

        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(api.token, forHTTPHeaderField: "Authorization")

        return request
    }
}
