import XCTest
@testable import API

class CommentsRequestTests: XCTestCase {

  func testCommentsRequest() {
    let request = CommentsRequest(postId: 1)
    
    XCTAssertEqual(HTTPMethod.get, request.method)
    XCTAssertEqual("/comments", request.url)
    XCTAssertEqual(1, request.body["postId"] as? Int)
    XCTAssertTrue(Comments.self == CommentsRequest.ResponseType.self)
  }
}
