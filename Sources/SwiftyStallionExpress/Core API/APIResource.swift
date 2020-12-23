//
//  APIResource.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//

import Foundation
import SwiftyJSON

class APIResource {
    let raw: JSON?

    required init(raw: JSON?) {
        self.raw = raw
    }
}
