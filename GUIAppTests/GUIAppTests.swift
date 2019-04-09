//
//  GUIAppTests.swift
//  GUIAppTests
//
//  Created by Kayn Critchley on 4/3/19.
//  Copyright © 2019 Kayn Critchley. All rights reserved.
//

import XCTest
@testable import GUIApp

class GUIAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }


    func testaddObject() {
        let location = Location(name:"Location", address: "Address", latitude: 209, longitude: 50)
        XCTAssertEqual(location.name, "Location")
        XCTAssertEqual(location.address, "Address")
        XCTAssertEqual(location.latitude, 209)
        XCTAssertEqual(location.longitude, 50)
    }
    

    func testaddObjectnil() {
        let location = Location(name:"Location", address: "Address", latitude: 209, longitude: 50)
        XCTAssertNotNil(location.name, "Location")
        XCTAssertNotNil(location.address, "Address")
        XCTAssertNotNil(location.latitude, String(0))
        XCTAssertNotNil(location.longitude, String(0))
    }

}
