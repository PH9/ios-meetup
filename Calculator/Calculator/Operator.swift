public class Operator {

  public static func plusNode(_ l: Node, _ r: Node) -> PlusNode {
    return PlusNode(l, r)
  }

  public static func minusNode(_ l: Node, _ r: Node) -> MinusNode {
    return MinusNode(l, r)
  }

  public static func multiplyNode(_ l: Node, _ r: Node) -> MultiplyNode {
    return MultiplyNode(l, r)
  }
}
