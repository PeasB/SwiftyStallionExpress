//
//  GetShipmentsRequest.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//
// https://app.swaggerhub.com/apis/nonibrands/StallionExpress/1.0.2#/shipment/getShipments
//

import Foundation

class getShipmentsRequest: APIRequest {
    typealias APIResourceType = getShipmentsResource
    
    let path: String = "/shipments"
    let method: HTTPMethod = .get
    var query: String?
    
    var status: String?
    var fromDate: Date?
    var toDate: Date?

    init(status: String?, fromDate: Date?, toDate: Date?) {
        self.status = status
        self.fromDate = fromDate
        self.toDate = toDate
        
        //Add Query Args.
        query?.appendIfNotNil(status) { "status=\($0)" }
        
        //TODO: Clean up argument Concat.
        if !(query?.isEmpty ?? true) { query! += "&" }
        query?.appendIfNotNil(fromDate) { "from_date=\($0.apiDateFormat())" }
        
        if !(query?.isEmpty ?? true) { query! += "&" }
        query?.appendIfNotNil(toDate) { "to_date=\($0.apiDateFormat())"}
    }
}

class getShipmentsResource: APIResource {
    var success: Bool? {
        return raw?["success"].boolValue
    }

    var shipments: [Shipment]? {
        guard let rawShipments = raw?["shipments"] else { return nil }
        var shipments: [Shipment] = []
        
        //Go through shipments and parse each of them if possible.
        for rawShipment in rawShipments.arrayValue {
            if let shipment = Shipment(json: rawShipment) {
                shipments.append(shipment)
            }
        }
        return shipments
    }
    
    var message: String? {
        return raw?["message"].stringValue
    }
    
    var errors: String? {
        return raw?["errors"].stringValue
    }
}
