//
//  Constants.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import Foundation
enum RequestError: Error {
    case invalidURL
    case failedNoData
    case failedToConvertData
    
    var localizedDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Sorry seems there is a problem with the service", comment: "")
        case .failedNoData:
            return  NSLocalizedString("Failed no data was returned", comment: "")
        case .failedToConvertData:
            return  NSLocalizedString("Failed to pass returned data", comment: "")
        }
    }
    
}
enum Links{
    static let path = "https://www.thecolorapi.com/id?rgb="
}
