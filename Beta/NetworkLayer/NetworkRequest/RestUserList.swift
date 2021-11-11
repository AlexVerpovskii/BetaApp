//
//  RestUserList.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import Foundation

final class RestUserList: BaseRequest {
    
    override var scheme: BaseRequest.Scheme { .https }
    
    override var httpMethod: BaseRequest.HttpMethod { .get }
    
    override var host: String { Constants.Server.Host.fakeApi.rawValue }
    
    override var parameters: [String : String] { return ["page": "2"] }
    
    override var endPoint: String { Constants.EndPoint.list.rawValue }
}
