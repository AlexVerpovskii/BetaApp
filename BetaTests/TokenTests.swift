//
//  TokenTests.swift
//  TokenTests
//
//  Created by black on 10.11.2021.
//

import XCTest
@testable import Beta

class TokenTests: XCTestCase {
    let token = "234car2casdf"
    let key = "token"
    
    override func setUp()  {
        super.setUp()
    }

    override func tearDown() {
       super.tearDown()
        UserDefaults.standard.removeObject(forKey: key)
    }

    func testExample() {
        //given
        UserSettings.token = token
        
        //when
        let userToken = UserDefaults.standard.string(forKey: key)
        XCTAssertEqual(userToken, token)
    }

}
