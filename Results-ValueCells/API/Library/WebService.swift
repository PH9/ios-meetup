public class WebService {

  public static let shared = WebService()

  let baseURL: String

  public init(baseURL: String = "https://jsonplaceholder.typicode.com") {
    self.baseURL = baseURL
  }

  @discardableResult
  public func request<R: RequestProtocol>(
    _ request: R,
    result: @escaping (Swift.Result<R.ResponseType, APIError>) -> Void)
    -> RequestConnection<R> {
      let connection = RequestConnection(request, baseURL: baseURL, headers: [:])
      connection.responseJSON(result: result)
      return connection
  }
}
