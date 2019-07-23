public struct CreatePostRequest: RequestProtocol {
  public let method: HTTPMethod = .post
  public let url = "/post"
  public typealias ResponseType = DummyResponse
}
