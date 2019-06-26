import XCTest
@testable import API
import Alamofire

class RequestProtocolTests: XCTestCase {

  func testHTTPMethod() {
    let getMethod = Alamofire.HTTPMethod(rawValue: API.HTTPMethod.get.rawValue)
    XCTAssertEqual(Alamofire.HTTPMethod.get, getMethod)

    let postMethod = Alamofire.HTTPMethod(rawValue: API.HTTPMethod.post.rawValue)
    XCTAssertEqual(Alamofire.HTTPMethod.post, postMethod)
  }

  struct DummyRequest: RequestProtocol {
    let url = "/path"
    typealias ResponseType = Bool
  }

  func testDummyRequest() {
    let request = DummyRequest()

    XCTAssertEqual(HTTPMethod.get, request.method)
    XCTAssertEqual("/path", request.url)
    XCTAssertEqual(0, request.headers.count)
    XCTAssertEqual(0, request.body.count)
  }
}
