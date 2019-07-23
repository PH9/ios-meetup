import XCTest
@testable import Calculator

class GodNodeTests: XCTestCase {

  func testDisplay_valueNode_printTheValue() {
    let valueNode = ValueNode(value: 1)
    XCTAssertEqual("1", try! valueNode.display())
  }

  func testDisplay_operatorNode_printTheEquation() {
    let operatorNode = GodNode(operator: Operator(operator: "+"), leftOperand: ValueNode(value: 1), rightOperand: ValueNode(value: 2))
    XCTAssertEqual("1 + 2", try! operatorNode.display())
  }

  func testDisplay_complexOperationNodes() {
    let f = GodNode(operator: Operator(operator: "*"), leftOperand: ValueNode(value: 2), rightOperand: ValueNode(value: 5))
    let g = GodNode(operator: Operator(operator: "+"), leftOperand: ValueNode(value: 3), rightOperand: f)

    XCTAssertEqual("3 + 2 * 5", try! g.display())
  }

  func testCompute_operationNode_givesTheComputedResult() {
    let opsNode = GodNode(operator: Operator(operator: "-"), leftOperand: ValueNode(value: 5), rightOperand: ValueNode(value: 3))
    XCTAssertEqual(2, try! opsNode.compute())
  }

  func testCompute_complexOperationNodes() {
    let f = GodNode(operator: Operator(operator: "*"), leftOperand: ValueNode(value: 2), rightOperand: ValueNode(value: 5))
    let g = GodNode(operator: Operator(operator: "+"), leftOperand: ValueNode(value: 3), rightOperand: f)

    XCTAssertEqual(13, try! g.compute())
  }

  func testPlus() {
    let node = GodNode(operator: Operator(operator: "+"), leftOperand: ValueNode(value: 3), rightOperand: ValueNode(value: 7))
    XCTAssertEqual(10, try! node.compute())
    XCTAssertEqual("3 + 7", try! node.display())
  }

  func testMinus() {
    let node = GodNode(operator: Operator(operator: "-"), leftOperand: ValueNode(value: 3), rightOperand: ValueNode(value: 7))
    XCTAssertEqual(-4, try! node.compute())
    XCTAssertEqual("3 - 7", try! node.display())
  }

  func testMultiply() {
    let node = GodNode(operator: Operator(operator: "*"), leftOperand: ValueNode(value: 3), rightOperand: ValueNode(value: 7))
    XCTAssertEqual(21, try! node.compute())
    XCTAssertEqual("3 * 7", try! node.display())
  }
}
