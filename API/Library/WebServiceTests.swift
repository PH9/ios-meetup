import XCTest
@testable import API

class WebServiceTests: XCTestCase {

    func testWebService() {
      let webService = WebService()

      XCTAssertEqual("https://jsonplaceholder.typicode.com", webService.baseURL)
    }
}
