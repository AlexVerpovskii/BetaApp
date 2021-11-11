//
//  BaseRequestProtocol.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import Foundation

protocol BaseRequestProtocol {
    var urlRequest: URLRequest? { get }
    var parameters: [String: String] { get }
}
