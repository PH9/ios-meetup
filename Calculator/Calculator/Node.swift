enum NodeError: Error {
  case unsupportedOperation
}

public class Node {

  // MARK: - Fields
  private let `operator`: String
  private let value: Int
  
  private let leftOperand: Node?
  private let rightOperand: Node?
  
  // MARK: - Constructor
  public init(`operator`: String, leftOperand: Node, rightOperand: Node) {
    self.operator = `operator`
    self.leftOperand = leftOperand
    self.rightOperand = rightOperand
    value = 0
  }
  
  public init(value: Int) {
    self.value = value
    `operator` = "#"
    leftOperand = nil
    rightOperand = nil
  }
  
  // MARK: - Functions
  public func compute() throws -> Int {
    switch `operator` {
    case "+": return try leftOperand!.compute() + rightOperand!.compute()
    case "-": return try leftOperand!.compute() - rightOperand!.compute()
    case "*": return try leftOperand!.compute() * rightOperand!.compute()
    case "#": return value
    default: throw NodeError.unsupportedOperation
    }
  }

  public func display() throws -> String {
    switch `operator` {
    case "+": return (try leftOperand!.display()) + " + " + (try rightOperand!.display())
    case "-": return (try leftOperand!.display()) + " - " + (try rightOperand!.display())
    case "*": return (try leftOperand!.display()) + " * " + (try rightOperand!.display())
    case "#": return "\(value)"
    default: throw NodeError.unsupportedOperation
    }
  }
}
