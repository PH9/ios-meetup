public typealias Comments = [Comment]

public struct Comment: Decodable {
  public let postId: Int
  public let id: Int
  public let name: String
  public let email: String
  public let body: String
}

public struct CommentsRequest: RequestProtocol {
  public let url = "/comments"
  public let body: [String: Any]

  public typealias ResponseType = Comments

  public init(postId: Int) {
    body = [
      "postId": postId
    ]
  }
}
