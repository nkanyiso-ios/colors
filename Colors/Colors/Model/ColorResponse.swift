//
//  ColorResponse.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/06.
//

import Foundation

struct ColorResponse: Codable{
    var hex: HexValue?
}

struct HexValue: Codable {
    var value: String
    var clean: String
}
