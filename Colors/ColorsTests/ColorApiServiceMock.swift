//
//  ColorApiServiceMock.swift
//  ColorsTests
//
//  Created by Nkanyiso Hlela on 2021/06/06.
//

import Foundation
@testable import Colors
class ColorApiServiceMock: ColorApiServiceProtocol {
    func convertRGBColorToHex(rgbColor: String, _ completion: @escaping (Result<ColorResponse, Error>) -> Void) {
        if(rgbColor == "255,255,255"){
            completion(.success(ColorResponse(hex: HexValue(value: "#FFFF", clean: "FFFF"))))
        }else{
            completion(.failure(RequestError.failedNoData))
        }
    }
    
}
