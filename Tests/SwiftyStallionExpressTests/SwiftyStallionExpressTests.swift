import XCTest
@testable import SwiftyStallionExpress

final class SwiftyStallionExpressTests: XCTestCase {
    
    let token = "Bearer KRrX44ZV4OMxtFsGbiIBLH8OoAcTo9FaqT9e0FaJ96Dhj3kdDyBqGlaq0fbI"
    func testGetShipmentsRequest() {
        
        
        // Create an expectation
        let expectation = self.expectation(description: "getShipments")
        let client = StallionAPI(token: token)
        var error: APIError?
        var shipments: [Shipment]?
        
        client.getShipments(status: "void requested") {
            error = $0
            shipments = $1
            
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fullfilled, or time out
        // after 5 seconds. This is where the test runner will pause.
        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertNil(error) //There should be no error
        XCTAssertNotNil(shipments)
        
    }

    static var allTests = [
        ("testGetShipments", testGetShipmentsRequest),
    ]
}
