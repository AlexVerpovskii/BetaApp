//
//  BaseRequest.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import Foundation

class BaseRequest: BaseRequestProtocol {
    
    typealias Scheme = Constants.Server.Scheme
    typealias Host = Constants.Server.Host
    typealias HttpMethod = Constants.Server.HTTPMethod
    
    var scheme: Scheme { return .https }
    
    var host: String { return "" }
    
    var httpBody: Data? { return nil }
    
    var httpMethod: HttpMethod { return .get }
    
    var endPoint: String { return ""}
    
    var parameters: [String: String] { return [:] }
    
    var urlRequest: URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.path = "/" + endPoint
        urlComponents.setQueryItems(with: parameters)
        
        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        request.httpBody = httpBody
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}

private extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
