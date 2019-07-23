import Foundation

enum JSONFileReaderError: Error {
  case cannotParseURL
  case cannotReadFile
  case cannotParseJSON
}

internal class JSONFileReader {

  internal static func readFile<T: Decodable>(name: String) throws -> T {
    guard let path = Bundle(for: self).path(forResource: name, ofType: "json") else {
        throw JSONFileReaderError.cannotParseURL
    }

    let url = URL(fileURLWithPath: path)
    guard let jsonData = try? Data(contentsOf: url, options: .mappedIfSafe) else {
      throw JSONFileReaderError.cannotReadFile
    }

    guard let model = try? JSONDecoder().decode(T.self, from: jsonData) else {
      throw JSONFileReaderError.cannotParseJSON
    }

    return model
  }
}
