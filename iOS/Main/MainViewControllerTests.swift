import XCTest
@testable import iOS
import API

class MainViewControllerTests: TestCase {

  class SpyMainPresenter: MainPresenter {

    var getPostsCalled = 0

    override func getPosts() {
      getPostsCalled += 1
      super.getPosts()
    }
  }

  class MyMainViewController: MainViewController {

    let expectation = XCTestExpectation(description: "Called")
    var didGetPost = 0
    var didGetError = 0

    override func mainPresenter(_ mainPresenter: MainPresenter, didGet posts: Posts) {
      didGetPost += 1
      expectation.fulfill()
    }

    override func mainPresenter(_ mainPresenter: MainPresenter, didGet error: APIError) {
      didGetError += 1
      expectation.fulfill()
    }
  }

  func testMainViewController() {
    let mainViewController = MyMainViewController()
    let spy = SpyMainPresenter()
    mainViewController.presenter = spy

    // TODO: Should call stub API not call directly to server
    mainViewController.viewDidLoad()
    mainViewController.viewWillAppear(false)

    wait(for: [mainViewController.expectation], timeout: 3)

    XCTAssertEqual(1, spy.getPostsCalled)
    XCTAssertEqual(1, mainViewController.didGetPost)
    XCTAssertEqual(0, mainViewController.didGetError)
  }

  func testView() {
    [Device.phone4_7inch, Device.phone5_8inch, Device.pad].forEach { device in
      let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
      let (parent, _) = traitControllers(device: device, child: controller)

      FBSnapshotVerifyView(parent.view, identifier: "\(device)")
    }
  }

}
