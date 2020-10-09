import XCTest
@testable import SwiftUIElemento

final class SwiftUIElementoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftUIElemento().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
