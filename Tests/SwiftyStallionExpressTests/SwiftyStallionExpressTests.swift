import XCTest
@testable import SwiftyStallionExpress

final class SwiftyStallionExpressTests: XCTestCase {

    static var allTests = [
        ("testGetShipments", testGetShipmentsRequest),
        ("testGerRates", testGetRates)
    ]

    let token = "ADD TEST TOKEN HERE" //TODO: Add token to test
    let testShipment = Shipment()

    override func setUp() {
        //Toronto Zoo :)
        testShipment.address1 = "2000 Meadowvale Rd"
        testShipment.city = "Toronto"
        testShipment.provinceCode = "ON"
        testShipment.postalCode = "M1B5K7"
        testShipment.value = 78.45
        testShipment.currency = "CAD"
        testShipment.countryCode = "CA"
        testShipment.weightUnit = "g"
        testShipment.weight = 100
        testShipment.length = 9
        testShipment.width = 5.5
        testShipment.height = 2.5
        testShipment.sizeUnit = "in"
        testShipment.needsPostage = true
        testShipment.isFBA = false
        testShipment.packageType = PackageType.parcel.rawValue
        testShipment.postageType = PostageType.canadaPost.rawValue
    }

    func testGetShipmentsRequest() {

        // Create an expectation
        let expectation = self.expectation(description: "getShipments")
        let client = StallionAPI(token: token)
        var error: APIError?
        var shipments: [Shipment]?

        client.getShipments(status: "incomplete", toDate: Date()) {
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

    func testGetRates() {

        // Create an expectation
        let expectation = self.expectation(description: "getRates")
        let client = StallionAPI(token: token)
        var error: APIError?
        var rates: [Rate]?

        client.getRates(shipment: testShipment) {
            error = $0
            rates = $1

            expectation.fulfill()
        }

        // Wait for the expectation to be fullfilled, or time out
        // after 5 seconds. This is where the test runner will pause.
        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertNil(error) //There should be no error
        XCTAssertNotNil(rates)
    }
}
