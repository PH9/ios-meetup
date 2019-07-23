import XCTest
@testable import Calculator

class NodeTests: XCTestCase {
  
  func testDisplay_valueNode_printTheValue() {
    let valueNode = Node(value: 1)
    XCTAssertEqual("1", try! valueNode.display())
  }
  
  func testDisplay_operatorNode_printTheEquation() {
    let operatorNode = Node(operator: "+", leftOperand: Node(value: 1), rightOperand: Node(value: 2))
    XCTAssertEqual("1 + 2", try! operatorNode.display())
  }
  
  func testDisplay_complexOperationNodes() {
    let f = Node(operator: "*", leftOperand: Node(value: 2), rightOperand: Node(value: 5))
    let g = Node(operator: "+", leftOperand: Node(value: 3), rightOperand: f)
    
    XCTAssertEqual("3 + 2 * 5", try! g.display())
  }
  
  func testCompute_operationNode_givesTheComputedResult() {
    let opsNode = Node(operator: "-", leftOperand: Node(value: 5), rightOperand: Node(value: 3))
    XCTAssertEqual(2, try! opsNode.compute())
  }
  
  func testCompute_complexOperationNodes() {
    let f = Node(operator: "*", leftOperand: Node(value: 2), rightOperand: Node(value: 5))
    let g = Node(operator: "+", leftOperand: Node(value: 3), rightOperand: f)
    
    XCTAssertEqual(13, try! g.compute())
  }
}
