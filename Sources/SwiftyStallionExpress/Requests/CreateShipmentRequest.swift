//
//  CreateShipmentRequest.swift
//  
//
//  Created by Adam Uncao on 2020-12-23.
//
// https://app.swaggerhub.com/apis/nonibrands/StallionExpress/1.0.2#/shipment/createShipment
//

import Foundation
import SwiftyJSON

class createShipmentRequest: APIRequest {
    typealias APIResourceType = createShipmentResource
    
    let path: String = "/shipments"
    let method: HTTPMethod = .post
    var query: String?
    
    var shipment: Shipment
    
    init?(shipment: Shipment) {
        self.shipment = shipment
        
        //Check to see if the shipment object has the required fields.
        if !validateShipment() { return nil }
    }
    
    func body() -> Data? {
        let body = JSON([
            "name": shipment.name!,
            "address1": shipment.address1!,
            "address2": shipment.address2 ?? "",
            "city": shipment.city!,
            "province_code": shipment.provinceCode!,
            "postal_code": shipment.postalCode!,
            "country_code": shipment.countryCode!,
            "phone": shipment.phone ?? "",
            "package_contents": shipment.packageContents!,
            "value": shipment.value!,
            "currency": shipment.currency!,
            "weight_unit": shipment.weightUnit!,
            "weight": shipment.weightUnit!,
            "length": shipment.length!,
            "width": shipment.width!,
            "height": shipment.height!,
            "size_unit": shipment.sizeUnit!,
            "tracking_number": shipment.trackingCode ?? "",
            "dropoff_date": shipment.dropOffDate?.apiDateFormat()!,
            "dropoff_location": shipment.dropOffLocation!,
            "needs_postage": shipment.needsPostage!,
            "is_fba": shipment.isFBA!,
            "package_type": shipment.packageTypeID!,
            "postage_type": shipment.postageTypeID!
        ])

        return body.rawString()?.data(using: .utf8)
    }
    
    func validateShipment() -> Bool {
        return shipment.name != nil
            && shipment.address1 != nil
            && shipment.city != nil
            && shipment.provinceCode != nil
            && shipment.countryCode != nil
            && shipment.packageContents != nil
            && shipment.value != nil
            && shipment.currency != nil
            && shipment.weight != nil
            && shipment.weightUnit != nil
            && shipment.length != nil
            && shipment.width != nil
            && shipment.height != nil
            && shipment.sizeUnit != nil
            && shipment.dropOffDate != nil
            && shipment.dropOffLocation != nil
            && shipment.needsPostage != nil
            && shipment.isFBA != nil
            && shipment.packageTypeID != nil
            && shipment.postageTypeID != nil
    }
}

class createShipmentResource: APIResource {
    var success: Bool? {
        return raw?["success"].boolValue
    }

    var label: String? {
        return raw?["label"].stringValue
    }

    var shipment: Shipment? {
        guard let rawShipment = raw?["shipment"] else { return nil }
        
        return Shipment(json: rawShipment)
    }
    
    var message: String? {
        return raw?["message"].stringValue
    }
    
    var errors: String? {
        return raw?["errors"].stringValue
    }
}

