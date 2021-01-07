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

class Shipment: BaseModel {
    
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
    var orderID: String?
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
    var packageType: String?
    var postageType: String?
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
    
    override func map(json: JSON) {
        self.id = json["id"].int
        self.user_id = json["user_id"].int
        self.name = json["name"].string
        self.phone = json["phone"].string
        self.address1 = json["address1"].string
        self.address2 = json["address2"].string
        self.city = json["city"].string
        self.provinceCode = json["province_code"].string
        self.postalCode = json["postal_code"].string
        self.countryCode = json["country_code"].string
        self.returnName = json["return_name"].string
        self.returnPhone = json["return_phone"].string
        self.returnAddress1 = json["return_address1"].string
        self.returnAddress2 = json["return_address2"].string
        self.returnCity = json["return_city"].string
        self.returnProvinceCode = json["return_province_code"].string
        self.returnPostalCode = json["return_postal_code"].string
        self.returnCountryCode = json["return_country_code"].string
        self.isFBA = json["is_fba"].bool
        self.needsPostage = json["needs_postage"].bool
        self.isPostagePaid = json["is_postage_paid"].bool
        self.tier = json["tier"].string
        self.packageContents = json["package_contents"].string
        self.dropOffDate = json["dropoff_date"].string?.toDate()
        self.dropOffLocation = json["dropoff_location"].string
        self.value = json["value"].float
        self.currency = json["currency"].string
        self.tax = json["tax"].float
        self.orderID = json["order_id"].string
        self.orderStore = json["order_store"].string
        self.length = json["length"].float
        self.width = json["width"].float
        self.height = json["height"].float
        self.sizeUnit = json["size_unit"].string
        self.weight = json["weight"].float
        self.weightUnit = json["weight_unit"].string
        self.signatureConfirmation = json["signature_confirmation"].bool
        self.postageRate = json["postage_rate"].float
        self.postageExpiryDate = json["postage_expiry_date"].string?.toDate()
        self.packageType = json["package_type_id"].string
        self.postageType = json["postage_type_id"].string
        self.totalAmountPaid = json["total_amt_paid"].float
        self.shipDate = json["ship_date"].string?.toDate()
        self.shipCode = json["ship_code"].string
        self.trackingStatus = json["tracking_status"].string
        self.trackingCode = json["tracking_code"].string
        self.trackingURL = json["tracking_url"].string
        self.statusID = json["status_id"].int
        self.handlingFee = json["handling_fee"].float
        self.barcode = json["barcode"].string
        self.createdAt = json["created_at"].string?.toDate()
        self.updatedAt = json["updated_at"].string?.toDate()
        self.deletedAt = json["deleted_at"].string?.toDate()
        self.labelAvailable = json["label_available"].bool
    }
}
