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
    let query: String?
    
    var status: String?
    var fromDate: Date?
    var toDate: Date?

    init(status: String?, fromDate: Date?, toDate: Date?) {
        self.status = status
        self.fromDate = fromDate
        self.toDate = toDate
        
        //Add Query Args.
        var query = ""
        var isFirst = true
        query.appendIfNotNil(status) {
            isFirst = false
            return "status=\($0)"
        }

        query.appendIfNotNil(fromDate) { "\(isFirst ? "" : "&")from_date=\($0.apiDateFormat())" }
        query.appendIfNotNil(toDate) { "\(isFirst ? "" : "&")to_date=\($0.apiDateFormat())" }
        self.query = query
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
