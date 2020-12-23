//
//  API.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//

import Foundation
import SwiftyJSON

final class API {
    
    let token: String
    let baseURL: String
    
    init(baseURL: String, token: String) {
        self.token = token
        self.baseURL = baseURL
    }
    
    @discardableResult
    func fetch<R: APIRequest>(_ request: R, completion: ((_ result: APIResponse<R.APIResourceType>) -> Void)?) -> URLSessionTask? {
        

        guard let urlRequest = request.request(api: self) else {
            completion?(.error(.malformedRequest))
            return nil
        }

        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 30
        let session = URLSession(configuration: configuration)
        
        #if DEBUG
        var body = ""
        if let data = request.body() {
            body = ": \(String(data: data, encoding: .utf8) ?? "")"
        }
        
        print("[REST][REQUEST]: \(urlRequest.url?.absoluteString ?? "")\(body)")
        #endif
        let task = session.dataTask(with: urlRequest) { (data, _, error) in
            func completeWithResponse(_ response: APIResponse<R.APIResourceType>) {
                DispatchQueue.main.async {
                    completion?(response)
                }
            }

            //Check for error.
            if let error = error as NSError? {
                #if DEBUG
                print("[REST][RESULT][ERROR][\(urlRequest.url?.absoluteString ?? "")]: \(error)")
                #endif
                completeWithResponse(.error(.error(error)))
            }

            guard let data = data else {
                #if DEBUG
                print("[REST][RESULT][\(urlRequest.url?.absoluteString ?? "")]: No data.")
                #endif
                completeWithResponse(.error(.noData))
                return
            }

            let json = try? JSON(data: data)
            completeWithResponse(APIResponse<R.APIResourceType>.resource(R.APIResourceType(raw: json)))
            
            #if DEBUG
            print("[REST][RESULT][\(urlRequest.url?.absoluteString ?? "")]: \(json?.rawString() ?? "").")
            #endif
        }

        task.resume()

        return task
    }
}
