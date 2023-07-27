//
//  AutoVitesseTests.swift
//  AutoVitesseTests
//
//  Created by Danail Dimitrov on 27.07.23.
//

import XCTest
@testable import AutoVitesse

final class AutoVitesseTests: XCTestCase {
    
    func testHashString() {
        let utils = Utils()
        let hashedString = utils.hashString("123")
        let expectedHash = "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3"
        XCTAssertEqual(hashedString, expectedHash)
    }
    func testCheckBools_AllTrue() {
        let utils = Utils()
        let bools = [true, true, true]
        let result = utils.checkBools(bools)
        XCTAssertTrue(result)
    }
    func testCheckBools_ContainsFalse() {
        let utils = Utils()
        let bools = [true, false, true]
        let result = utils.checkBools(bools)
        XCTAssertFalse(result)
    }
    func testCheckBools_EmptyArray() {
        let utils = Utils()
        let bools: [Bool] = []
        let result = utils.checkBools(bools)
        XCTAssertTrue(result)
    }
    func testGenerateArray() {
        let utils = Utils()
        let min = 1
        let max = 5
        let result = utils.generateArray(min: min, max: max)
        XCTAssertEqual(result, [1, 2, 3, 4, 5])
    }
    func testGenerateArray_Empty() {
        let utils = Utils()
        let min = 5
        let max = 1
        let result = utils.generateArray(min: min, max: max)
        XCTAssertEqual(result, [])
    }
    func testGenerateArray_SameValue() {
        let utils = Utils()
        let min = 2
        let max = 2
        let result = utils.generateArray(min: min, max: max)
        XCTAssertEqual(result, [])
    }
    func testCheckBlanks_AllNonEmptyStrings() {
        let utils = Utils()
        let strings = ["Test", "Test2", "Test3"]
        let result = utils.checkBlanks(strings)
        XCTAssertTrue(result)
    }
    func testCheckBlanks_ContainsEmptyString() {
        let utils = Utils()
        let strings = ["Test", "", "Test3"]
        let result = utils.checkBlanks(strings)
        XCTAssertFalse(result)
    }
    func testCheckBlanks_EmptyArray() {
        let utils = Utils()
        let strings: [String] = []
        let result = utils.checkBlanks(strings)
        XCTAssertTrue(result)
    }
}
