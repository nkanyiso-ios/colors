//
//  ColorApiService.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import Foundation
import Alamofire

protocol ColorApiServiceProtocol {func convertRGBColorToHex(rgbColor:String , _ completion: @escaping (Result<ColorResponse, Error>) -> Void)}

class ColorApiService: ColorApiServiceProtocol {
    func convertRGBColorToHex(rgbColor:String, _ completion: @escaping (Result<ColorResponse, Error>) -> Void) {
        let url = Links.path + rgbColor;
        print("Fetching = \(url)")
        AF.request(url, method: .get).response{ response in
            switch (response.result) {
            case .success:
                if let data = response.data {
                    let results = try? JSONDecoder().decode(ColorResponse.self, from: data)
                    if let result = results { completion(.success(result)) }
                    else { completion(.failure(RequestError.failedToConvertData)) }
                }else{
                    completion(.failure(RequestError.failedNoData))
                }
                
            case .failure( let error):
                completion(.failure(error))
                print(error)
            }
        }
    }
}
