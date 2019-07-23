public class Calculator {

  // MARK: - Fields
  private let node: Node

  // MARK: - Constructor
  public init(_ n: Node) {
    self.node = n
  }

  // MARK: - Functions
  public func compute() throws -> Int {
    return try node.compute()
  }

  public func display() throws -> String {
    return try node.display()
  }
}
