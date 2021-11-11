//
//  Data.swift
//  Beta
//
//  Created by black on 10.11.2021.
//

import Foundation

struct DataModel: Decodable {
    var data: [User]
}

struct User: Decodable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}
