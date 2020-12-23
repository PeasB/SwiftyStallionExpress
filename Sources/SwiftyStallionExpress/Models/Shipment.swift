//
//  Shipment.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//
// https://app.swaggerhub.com/apis/nonibrands/StallionExpress/1.0.2#/Shipment
//


import Foundation
import SwiftyJSON

struct Shipment {
    
    init?(json: JSON) {
        //TODO: Map JSON to object.
        self.init()
    }
    
    init() { }
    
    func toJson() -> JSON {
        return JSON()
    }
    
    var id: Int?
    var user_id: Int?
    var name: String?
    var phone: String?
    var address1: String?
    var address2: String?
    var city: String?
    var provinceCode: String?
    var postalCode: String?
    var countryCode: String?
    var returnName: String?
    var returnPhone: String?
    var returnAddress1: String?
    var returnAddress2: String?
    var returnCity: String?
    var returnProvinceCode: String?
    var returnPostalCode: String?
    var returnCountryCode: String?
    var isFBA: Bool?
    var needsPostage: Bool?
    var isPostagePaid: Bool?
    var tier: String?
    var packageContents: String?
    var dropOffDate: Date?
    var dropOffLocation: String?
    var value: Float?
    var currency: String?
    var tax: Float?
    var orderID: Int?
    var orderStore: String?
    var length: Float?
    var width: Float?
    var height: Float?
    var sizeUnit: String?
    var weight: Float?
    var weightUnit: String?
    var signatureConfirmation: Bool?
    var postageRate: Float?
    var postageExpiryDate: Date?
    var packageTypeID: String?
    var postageTypeID: String?
    var totalAmountPaid: Float?
    var shipDate: Date?
    var shipCode: String?
    var trackingStatus: String?
    var trackingCode: String?
    var trackingURL: String?
    var statusID: Int?
    var handlingFee: Float?
    var barcode: String?
    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?
    var labelAvailable: Bool?

}
