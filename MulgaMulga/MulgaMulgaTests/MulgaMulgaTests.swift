//
//  MulgaMulgaTests.swift
//  MulgaMulgaTests
//
//  Created by 지북 on 2021/09/07.
//

import XCTest
@testable import MulgaMulga

class MulgaMulgaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_EndPoinURL() throws {
        let endPoint = EndPoint(type: .json, startIndex: 1, endIndex: 5, marketName: "하나로마트", guName: "중곡동")
        let url = endPoint.url()
        
        XCTAssertEqual(url, "http://openapi.seoul.go.kr:8088/514f78706667686937326152654554/json/ListNecessariesPricesService/1/5/하나로마트/중곡동")
    }
}
