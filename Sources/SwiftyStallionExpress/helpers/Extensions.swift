//
//  Extensions.swift
//  
//
//  Created by Adam Uncao on 2020-12-22.
//

import Foundation

extension String {
    mutating func appendIfNotNil<T: CustomStringConvertible>(_ stringConvertible: T?, transform: ((T) -> String)?) {
        if let stringConvertible = stringConvertible {
            self += transform?(stringConvertible) ?? stringConvertible.description
        }
    }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return dateFormatter.date(from: self)
    }
    
}

extension Date {
    
    func apiDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        return dateFormatter.string(from: self)
    }
}
