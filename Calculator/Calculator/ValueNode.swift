public class ValueNode: Node {

  private let value: Int

  public init(_ value: Int) {
    self.value = value
  }

  public func compute() throws -> Int {
    return value
  }

  public func display() throws -> String {
    return "\(value)"
  }
}
