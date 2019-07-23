import XCTest
import FBSnapshotTestCase

class TestCase: FBSnapshotTestCase {

    override func setUp() {
      super.setUp()
      preferredSimulatorCheck()
      recordMode = false
    }

    override func tearDown() {
      super.tearDown()
    }
}

internal func preferredSimulatorCheck() {
  let iOSVersion = 13
  let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
  let currentSystemVersion = UIDevice.current.systemVersion

  guard ["iPhone10,1", "iPhone10,4"].contains(identifier),
    currentSystemVersion.starts(with: "\(iOSVersion)")
    else {
      fatalError("""
        Please only test and record screenshots on an iPhone 8 simulator running iOS \(iOSVersion),
        You are running on \(currentSystemVersion), \(identifier)
        """)
  }
}
