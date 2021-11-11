//
//  NetworkApi.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import Foundation
import Alamofire

final class NetworkApi {
    typealias Error = Constants.Server.NetworkError
    
    static let shared = NetworkApi()
    
    func sendRequest<Request: BaseRequestProtocol, Model: Decodable>(request: Request, model: Model, completion: @escaping
//   Swift.Result<Data?, Error>)
        (Model) -> Void) {
        guard let urlRequest = request.urlRequest else {
//            completion(.failure(.noUrlRequest))
            return
        }
        AF.request(urlRequest).responseJSON { response in
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                case 400:
//                    completion(.failure(.badRequest))
                    completion(model)
                    print("Плохой запрос")
                case 500:
//                    completion(.failure(.noData))
                    print("Нул поинтер")
                case 200...299:
                    if let data = response.data {
                        if let data = try? JSONDecoder().decode(Model.self, from: data) {
                            completion(data)
                        }
                    }
                default:
//                    completion(.failure(.other(statusCode: statusCode)))
                    print("фейл с ошибкой \(statusCode)")

                }
            }
        }
    }
}
