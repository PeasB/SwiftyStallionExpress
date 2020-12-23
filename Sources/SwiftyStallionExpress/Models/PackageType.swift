//
//  PackageType.swift
//  
//
//  Created by Adam Uncao on 2020-12-23.
//

import Foundation

enum PackageType: String {
    case legalFlatRateEvelope = "Legal Flat Rate Envelope"
    case flatRatePaddedEnvelope = "Flat Rate Padded Envelope"
    case smallFlatRateBox = "Small Flat Rate Box"
    case mediumFlatRateBox1 = "Medium Flat Rate Box 1"
    case mediumFlatRateBox2 = "Medium Flat Rate Box 2"
    case largeFlatRateBox = "Large Flat Rate Box"
    case regionalRateBoxA1 = "Regional Rate Box A1"
    case regionalRateBoxA2 = "Regional Rate Box A2"
    case regionalRateBoxB1 = "Regional Rate Box B1"
    case regionalRateBoxB2 = "Regional Rate Box B2"
    case letter = "Letter"
    case largeEvelopeOrFlat = "Large Envelope or Flat"
    case ThickEvelope = "Thick Envelope"
    case parcel = "Parcel"
    
    
}

enum PostageType: String {
    case uspsFirstClassMail = "USPS First Class Mail"
    case uspsPriorityMail = "USPS Priority Mail"
    case uspsExpressMail = "USPS Express Mail"
    case uspsParcelSelect = "USPS Parcel Select"
    case uspsMediaMail = "USPS Media Mail"
    case uspsLibraryMail = "USPS Library Mail"
    case fedex = "FedEx"
    case ups = "UPS"
    case canadaPost = "Canada Post"
    case postNL = "PostNL"
}
