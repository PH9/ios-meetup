public enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
}

public protocol RequestProtocol {
  var method: HTTPMethod { get }
  var url: String { get }
  var headers: [String: String] { get }
  var body: [String: Any] { get }
  associatedtype ResponseType: Decodable
}

extension RequestProtocol {

  public var method: HTTPMethod {
    return .get
  }

  public var headers: [String: String] {
    return [:]
  }

  public var body: [String: Any] {
    return [:]
  }
}

public enum APIError: Error {
  case error(Error)
  case dataIsNil
  case cannotParseData
}
