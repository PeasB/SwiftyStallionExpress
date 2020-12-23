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
    
    var id: Int = 0
    var user_id: Int = 0
    var name: String = ""
    var phone: String = ""
    var address1: String = ""
    var address2: String = ""
    var city: String = ""
    var provinceCode: String = ""
    var postalCode: String = ""
    var countryCode: String = ""
    var returnName: String = ""
    var returnPhone: String = ""
    var returnAddress1: String = ""
    var returnAddress2: String = ""
    var returnCity: String = ""
    var returnProvinceCode: String = ""
    var returnPostalCode: String = ""
    var returnCountryCode: String = ""
    var isFBA: Bool = false
    var needsPostage: Bool = true
    var isPostagePaid: Bool = false
    var tier: String = ""
    var packageContents: String = ""
    var dropOffDate: Date?
    var dropOffLocation: String = ""
    var value: Float = 0.0
    var currency: String = ""
    var tax: Float  = 0.0
    var orderID: Int = 0
    var orderStore: String = ""
    var length: Float = 0.0
    var width: Float = 0.0
    var height: Float = 0.0
    var sizeUnit: String = ""
    var weight: Float = 0.0
    var weightUnit: String = ""
    var signatureConfirmation: Bool = false
    var postageRate: Float = 0.0
    var postageExpiryDate: Date?
    var packageTypeID: String = ""
    var postageTypeID: String = ""
    var totalAmountPaid: Float = 0.0
    var shipDate: Date?
    var shipCode: String = ""
    var trackingStatus: String = ""
    var trackingCode: String = ""
    var trackingURL: String = ""
    var statusID: Int = 0
    var handlingFee: Float = 0.0
    var barcode: String = ""
    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?
    var labelAvailable: Bool = false

}
