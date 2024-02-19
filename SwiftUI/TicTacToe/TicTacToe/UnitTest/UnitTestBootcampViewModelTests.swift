//
//  UnitTestBootcampViewModelTests.swift
//  TicTacToeTests
//
//  Created by Codes Orbit on 18/02/2024.
//

import XCTest
@testable import TicTacToe
// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[Struct or class]_[function or variable]_[expected result]
// Testing Structure: Given When Then

final class UnitTestBootcampViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_unitTestViewModel_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium: Bool = true
        // When
        let vmTest = UnitTestBootcampViewModel(isPremium: userIsPremium)
        // Then
        XCTAssertTrue(vmTest.isPremium)
    }
    func test_unitTestViewModel_isPremium_shouldBeFalse() {
        // Given
        let userIsPremium: Bool = false
        // When
        let vmTest = UnitTestBootcampViewModel(isPremium: userIsPremium)
        // Then
        XCTAssertFalse(vmTest.isPremium)
    }
    func test_unitTestViewModel_isPremium_shouldBeInjectedValue() {
        // Given
        let userIsPremium: Bool = Bool.random()
        // When
        let vmTest = UnitTestBootcampViewModel(isPremium: userIsPremium)
        // Then
        XCTAssertEqual(userIsPremium, vmTest.isPremium)
    }
    func test_unitTestViewModel_isPremium_shouldBeInjectedValue_Stress() {
        for _ in 0...10 {
            // Given
            let userIsPremium: Bool = Bool.random()
            // When
            let vmTest = UnitTestBootcampViewModel(isPremium: userIsPremium)
            // Then
            XCTAssertEqual(userIsPremium, vmTest.isPremium)
        }
    }
    func test_unitTestViewModel_dataArray_shouldBeEmpty() {
        // When
        let vmTest = UnitTestBootcampViewModel(isPremium: .random())
        // Then
        XCTAssertTrue(vmTest.dataArray.isEmpty)
//        XCTAssertEqual(0, vmTest.dataArray.count)
    }
    func test_unitTestViewModel_dataArray_shouldAddItem() {
        // Given
        let vmTest = UnitTestBootcampViewModel(isPremium: Bool.random())
        // When
        vmTest.addItem(item: UUID().uuidString)
        // Then
        XCTAssertTrue(!vmTest.dataArray.isEmpty)
        XCTAssertEqual(vmTest.dataArray.count, 1)
        XCTAssertNotEqual(vmTest.dataArray.count, 0)
        XCTAssertGreaterThan(vmTest.dataArray.count, 0)
    }
    func test_unitTestViewModel_dataArray_shouldAddMultipleItems() {
        // Given
        let vmTest = UnitTestBootcampViewModel(isPremium: Bool.random())
        // When
        let loopCount: Int = Int.random(in: 1..<100)
        for val in 1...loopCount {
            vmTest.addItem(item: "Hello\(val)")
        }
        // Then
        XCTAssertTrue(!vmTest.dataArray.isEmpty)
        XCTAssertEqual(vmTest.dataArray.count, loopCount)
    }
}
