//
//  ColorApiService.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import Foundation
import Alamofire

protocol ColorApiServiceProtocol {func convertRGBColorToHex(url:String ,method:HTTPMethod,_ completion: @escaping (Result<Data, Error>) -> Void)}

class ColorApiService: ColorApiServiceProtocol {
    func convertRGBColorToHex(url:String ,method:HTTPMethod,_ completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url, method: .get).response{ response in
            
            switch (response.result) {
            case .success:
                if let data = response.data {
                    completion(.success(data))
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
