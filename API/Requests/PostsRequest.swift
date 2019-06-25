public typealias Posts = [Post]

public struct Post: Decodable {
  public let userId: Int
  public let id: Int
  public let title: String
  public let body: String
}

public struct PostsRequest: RequestProtocol {
  public let url = "/posts"
  public typealias ResponseType = Posts

  public init() {

  }
}
