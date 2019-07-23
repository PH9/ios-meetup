public class OperatorNode: Node {
  public let leftOperand: Node
  public let rightOperand: Node

  public init(_ l: Node, _ r: Node) {
    leftOperand = l
    rightOperand = r
  }

  public func compute() throws -> Int {
    throw NodeError.unimplemented
  }

  public func display() throws -> String {
    throw NodeError.unimplemented
  }
}

public class PlusNode: OperatorNode {
  public override func compute() throws -> Int {
    return (try leftOperand.compute()) + (try rightOperand.compute())
  }

  public override func display() throws -> String {
    return "\(try leftOperand.display()) + \(try rightOperand.display())"
  }
}

public class MinusNode: OperatorNode {
  public override func compute() throws -> Int {
    return (try leftOperand.compute()) - (try rightOperand.compute())
  }

  public override func display() throws -> String {
    return "\(try leftOperand.display()) - \(try rightOperand.display())"
  }
}

public class MultiplyNode: OperatorNode {
  public override func compute() throws -> Int {
    return (try leftOperand.compute()) * (try rightOperand.compute())
  }

  public override func display() throws -> String {
    return "\(try leftOperand.display()) * \(try rightOperand.display())"
  }
}
