//
//  ColorApiService.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import Foundation
import Alamofire

protocol ColorApiServiceProtocol {func convertRGBColorToHex(rgbColor: String , _ completion: @escaping (Result<ColorResponse, Error>) -> Void)}

class ColorApiService: BaseApiService, ColorApiServiceProtocol {
    
    func convertRGBColorToHex(rgbColor: String, _ completion: @escaping (Result<ColorResponse, Error>) -> Void) {
        let urlString = Links.path + rgbColor;
        guard let url = URL(string: urlString) else { return }
        let colorResource = Resource<ColorResponse>(url: url, httpVerb: HTTPMethod.get, parameters: [:],encoding: URLEncoding.default)
        sendRequest(resource: colorResource,  { result in
            completion(result)
        })
    }
    
}
