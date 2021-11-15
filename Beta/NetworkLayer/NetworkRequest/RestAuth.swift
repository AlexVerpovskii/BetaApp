//
//  AuthRequest.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import Foundation

final class RestAuth: BaseRequest {
    private let body: AuthModel
    
    override var scheme: BaseRequest.Scheme { .https }
    
    override var httpMethod: BaseRequest.HttpMethod { .post }
    
    override var host: String { Constants.Server.Host.fakeApi.rawValue }
    
    override var endPoint: String { Constants.EndPoint.auth.rawValue }
    
    override var httpBody: Data? {
        do {
            return try JSONEncoder().encode(body)
        } catch {
            print("Сделать логирование")
        }
        return nil
    }
    
    init(login: AuthModel) {
        self.body = login
        super.init()
    }
}
