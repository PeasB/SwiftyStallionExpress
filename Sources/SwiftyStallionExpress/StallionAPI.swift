//
//  StallionAPI.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//

import Foundation

fileprivate let baseURL = "https://ship.stallionexpress.ca/api/v1"

class StallionAPI {
    
    private let api: API

    init(token: String) {
        self.api = API(baseURL: baseURL, token: token)
    }
    
    //TODO: API requests here.
    
    func getShipments(status: String? = nil, fromDate: Date? = nil, toDate: Date? = nil, completion: @escaping (_ error: APIError?, _ Shipments: [Shipment]?) -> Void) {
        
        let request = getShipmentsRequest(status: status, fromDate: fromDate, toDate: toDate)
        api.fetch(request) { response in
            switch response {
                case .resource(let resource):
                    guard resource.success == true else {
                        //the request failed so we give an internal error and any informaton we have.
                        return completion(APIError.InternalError(resource.message ?? resource.errors), nil)
                    }
                    
                    completion(nil, resource.shipments)

                case .error(let error):
                    completion(error, [])
            }
        }
    }
    
    
}
