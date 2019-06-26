import Alamofire

public class RequestConnection<R: RequestProtocol> {

  let request: R
  private let afRequest: DataRequest

  init(_ request: R, baseURL: String, headers: [String: String]) {
    self.request = request
    let afHTTPMethod = Alamofire.HTTPMethod(rawValue: request.method.rawValue)!
    afRequest = Alamofire.request(
      baseURL + request.url,
      method: afHTTPMethod,
      parameters: request.body,
      headers: headers + request.headers)
  }

  public func cancel() {
    afRequest.cancel()
  }

  @discardableResult
  func responseJSON(result: @escaping (Swift.Result<R.ResponseType, APIError>) -> Void) -> Self {
    afRequest.responseJSON { response in
      if let error = response.error {
        result(.failure(.error(error)))
        return
      }

      guard let data = response.data else {
        result(.failure(.dataIsNil))
        return
      }

      guard let model = try? JSONDecoder().decode(R.ResponseType.self, from: data) else {
        result(.failure(.cannotParseData))
        return
      }

      result(.success(model))
    }
    return self
  }
}

private func + (_ left: [String: String], _ right: [String: String]) -> [String: String] {
  var newDict = left

  for (k, v) in right {
    newDict[k] = v
  }

  return newDict
}
