//
//  BaseApiService.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/07.
//
import Foundation
import Alamofire
struct Resource<T: Codable> {
    let url: URL
    var httpVerb: HTTPMethod = .get //Keep Default as a GET
    var parameters: [String: Any]
    var body: Data? = nil // this will work for other Verbs such as POST
    var headers: HTTPHeaders?
    var encoding: ParameterEncoding = JSONEncoding.default
}

public class BaseApiService {
    func sendRequest<T>(resource: Resource<T>,
                        _ completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(resource.url,
                   method: resource.httpVerb,
                   parameters: resource.parameters, encoding: resource.encoding, headers: resource.headers).response{ response in
                    switch (response.result) {
                    case .success:
                        if let data = response.data {
                            let results = try? JSONDecoder().decode(T.self, from: data)
                            if let result = results { completion(.success(result)) }
                            else { completion(.failure(RequestError.failedToConvertData)) }
                        }
                    case .failure( let error):
                        completion(.failure(error))
                    }
                   }
    }
}
