//
//  ResultTests.swift
//  Overdrive
//
//  Created by Said Sikira on 8/26/16.
//  Copyright © 2016 Said Sikira. All rights reserved.
//

import XCTest

@testable import Overdrive

class ResultTests: XCTestCase {
    
    func testComputedProperties() {
        let result: Result = .value(10)
        
        XCTAssertEqual(result.value, 10)
        XCTAssertNil(result.error)
    }
    
    func testMapWithValue() {
        let result: Result = .value(10)
        let stringResult = result.map { String($0) }
        
        XCTAssertEqual(stringResult.value, "10")
    }
    
    func testMapWithError() {
        let result: Result<Int> = .error(TaskError.fail(""))
        let stringResult = result.map { String($0) }
        
        XCTAssertNotNil(stringResult.error)
    }
    
    func testFlatMap() {
        let result: Result = .value(10)
        let stringResult = result.flatMap { return Result("\($0)") }
        
        XCTAssertEqual(stringResult.value, "10")
        XCTAssertNil(stringResult.error)
    }
}
