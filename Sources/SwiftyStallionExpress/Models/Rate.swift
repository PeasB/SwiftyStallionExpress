//
//  File.swift
//  
//
//  Created by Adam Uncao on 2021-01-05.
//

import Foundation
import SwiftyJSON

class Rate: BaseModel {
    
    var id: String?
    var postage_type: String?
    var package_type: String?
    var tax: Float?
    var rate: Float?
    var handling_fee: Float?
    var tier: String?
    var currency: String?
    var est_delivery: String?
    var deliver_days: String?
    
    override func map(json: JSON) {
        self.id = json["id"].rawString() //Documentation says this should be an int but in some cases its a string...
        self.postage_type = json["postage_type"].string
        self.package_type = json["package_type"].string
        self.tax = json["tax"].float
        self.rate = json["rate"].float
        self.handling_fee = json["handling_fee"].float
        self.tier = json["tier"].string
        self.currency = json["currency"].string
        self.est_delivery = json["est_delivery_time"].string
        self.deliver_days = json["delivery_days"].string
    }
}
