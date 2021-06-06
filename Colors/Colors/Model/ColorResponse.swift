//
//  ColorResponse.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/06.
//

import Foundation

struct ColorResponse: Codable{
    var hex: hexValue?
}

struct hexValue: Codable {
    var value: String
    var clean: String
}
