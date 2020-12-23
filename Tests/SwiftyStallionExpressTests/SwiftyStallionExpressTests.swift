import XCTest
@testable import SwiftyStallionExpress

final class SwiftyStallionExpressTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftyStallionExpress().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
