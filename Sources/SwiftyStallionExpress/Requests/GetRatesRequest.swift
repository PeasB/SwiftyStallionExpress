//
//  GetRatesRequest.swift
//  
//
//  Created by Adam Uncao on 2021-01-05.
//
// https://app.swaggerhub.com/apis/nonibrands/StallionExpress/1.0.2#/shipment/getQuote
//

import Foundation
import SwiftyJSON

class getRatesRequest: APIRequest {
    typealias APIResourceType = getRatesResource
    
    let path: String = "/rates"
    let method: HTTPMethod = .post
    
    let shipment: Shipment
    
    init?(shipment: Shipment) {
        self.shipment = shipment
        
        //Check to see if the shipment object has the required fields.
        if !validateShipment() { return nil }
    }

    func body() -> Data? {
        let body = JSON([
            "address1": shipment.address1!,
            "address2": shipment.address2 ?? "",
            "city": shipment.city!,
            "province_code": shipment.provinceCode!,
            "postal_code": shipment.postalCode!,
            "country_code": shipment.countryCode!,
            "value": shipment.value!,
            "currency": shipment.currency!,
            "weight_unit": shipment.weightUnit!,
            "weight": shipment.weight!,
            "length": shipment.length!,
            "width": shipment.width!,
            "height": shipment.height!,
            "size_unit": shipment.sizeUnit!,
            "needs_postage": shipment.needsPostage!,
            "is_fba": shipment.isFBA!,
            "package_type": shipment.packageType!,
        ])
        
        return body.rawString()?.data(using: .utf8)
    }
    
    func validateShipment() -> Bool {
        return shipment.address1 != nil
            && shipment.city != nil
            && shipment.provinceCode != nil
            && shipment.postalCode != nil
            && shipment.countryCode != nil
            && shipment.value != nil
            && shipment.currency != nil
            && shipment.weight != nil
            && shipment.weightUnit != nil
            && shipment.length != nil
            && shipment.width != nil
            && shipment.height != nil
            && shipment.sizeUnit != nil
            && shipment.needsPostage != nil
            && shipment.isFBA != nil
            && shipment.packageType != nil
    }
    
}

class getRatesResource: APIResource {
    var success: Bool? {
        return raw?["success"].boolValue
    }
    
    var rates: [Rate]? {
        guard let rawRates = raw?["rates"] else { return nil }
        var rates: [Rate] = []
        
        for rawRate in rawRates.arrayValue {
            if let rate = Rate(json: rawRate) {
                rates.append(rate)
            }
        }
        
        return rates
    }
    
    var message: String? {
        return raw?["message"].stringValue
    }
    
    var errors: String? {
        return raw?["errors"].stringValue
    }
}
