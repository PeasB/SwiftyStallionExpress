//
//  BaseModel.swift
//  
//
//  Created by Adam Uncao on 2021-01-07.
//

import Foundation
import SwiftyJSON

class BaseModel {
    let json: JSON
    
    init?(json: JSON) {
        self.json = json
        self.map(json: json)
    }
    
    init() { self.json = JSON() }
    
    func map(json: JSON) { }
}
