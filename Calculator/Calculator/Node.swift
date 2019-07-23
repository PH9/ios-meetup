enum NodeError: Error {
  case unsupportedOperation
  case unimplemented
}

public protocol Node {
  func compute() throws -> Int
  func display() throws -> String
}
