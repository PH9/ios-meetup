public class GodNode: Node {

  // MARK: - Fields
  private let `operator`: Operator
  private let value: Int

  private let leftOperand: Node?
  private let rightOperand: Node?

  // MARK: - Constructor
  public init(`operator`: Operator, leftOperand: Node, rightOperand: Node) {
    self.operator = `operator`
    self.leftOperand = leftOperand
    self.rightOperand = rightOperand
    value = 0
  }

  public init(value: Int) {
    self.value = value
    `operator` = Operator(operator: "#")
    leftOperand = nil
    rightOperand = nil
  }

  // MARK: - Functions
  public func compute() throws -> Int {
    switch `operator`.operator {
    case "+": return try Operator.plusNode(leftOperand!, rightOperand!).compute()
    case "-": return try Operator.minusNode(leftOperand!, rightOperand!).compute()
    case "*": return try Operator.multiplyNode(leftOperand!, rightOperand!).compute()
    default: throw NodeError.unsupportedOperation
    }
  }

  public func display() throws -> String {
    switch `operator`.operator {
    case "+": return try Operator.plusNode(leftOperand!, rightOperand!).display()
    case "-": return try Operator.minusNode(leftOperand!, rightOperand!).display()
    case "*": return try Operator.multiplyNode(leftOperand!, rightOperand!).display()
    default: throw NodeError.unsupportedOperation
    }
  }
}
