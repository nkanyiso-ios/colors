//
//  Constants.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import Foundation
enum RequestError: Error {
    case genericError
    case failedNoData
    case failedToConvertData
    
    var localizedDescription: String? {
        switch self {
        case .genericError:
            return NSLocalizedString("General system errror please try again later", comment: "")
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
