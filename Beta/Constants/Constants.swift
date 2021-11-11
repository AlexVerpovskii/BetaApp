//
//  Constants.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import Foundation

enum Constants {
    enum Server {
        enum Host: String {
            case fakeApi = "reqres.in"
        }
        
        enum HTTPMethod: String {
            case get = "GET"
            case post = "POST"
            case put = "PUT"
            case patch = "PATCH"
            case delete = "DELETE"
        }

        enum Scheme: String {
            case http
            case https
        }
        
        enum NetworkError: Error {
            case noData
            case noUrlRequest
            case badRequest
            case other(statusCode: Int)
            case deserialization
        }
    }
    
    enum EndPoint: String {
        case auth = "api/login"
        case list = "api/users"
    }
    
    
    
}
