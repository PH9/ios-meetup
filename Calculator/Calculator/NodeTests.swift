import XCTest
@testable import Calculator

class GodNodeTests: XCTestCase {

  func testDisplay_valueNode_printTheValue() {
    let valueNode = ValueNode(1)
    XCTAssertEqual("1", try! valueNode.display())
  }

  func testDisplay_operatorNode_printTheEquation() {
    let n = Operator.plusNode(ValueNode(1), ValueNode(2))
    let operatorNode = Calculator(n)
    XCTAssertEqual("1 + 2", try! operatorNode.display())
  }

  func testDisplay_complexOperationNodes() {
    let n = Operator.multiplyNode(ValueNode(2), ValueNode(5))
    let f = Operator.plusNode(ValueNode(3), n)
    let g = Calculator(f)

    XCTAssertEqual("3 + 2 * 5", try! g.display())
  }

  func testCompute_operationNode_givesTheComputedResult() {
    let n = Operator.minusNode(ValueNode(5), ValueNode(3))
    let opsNode = Calculator(n)
    XCTAssertEqual(2, try! opsNode.compute())
  }

  func testCompute_complexOperationNodes() {
    let n = Operator.multiplyNode(ValueNode(2), ValueNode(5))
    let f = Operator.plusNode(ValueNode(3), n)
    let g = Calculator(f)

    XCTAssertEqual(13, try! g.compute())
  }

  func testPlus() {
    let n = Operator.plusNode(ValueNode(3), ValueNode(7))
    let node = Calculator(n)
    XCTAssertEqual(10, try! node.compute())
    XCTAssertEqual("3 + 7", try! node.display())
  }

  func testMinus() {
    let n = Operator.minusNode(ValueNode(3), ValueNode(7))
    let node = Calculator(n)
    XCTAssertEqual(-4, try! node.compute())
    XCTAssertEqual("3 - 7", try! node.display())
  }

  func testMultiply() {
    let n = Operator.multiplyNode(ValueNode(3), ValueNode(7))
    let node = Calculator(n)
    XCTAssertEqual(21, try! node.compute())
    XCTAssertEqual("3 * 7", try! node.display())
  }
}
