import XCTest
@testable import iOS
import API

class PostViewControllerTests: TestCase {

  class SpyPostPresenter: PostPresenter {

    var getPostsCalled = 0

    override func getPosts() {
      getPostsCalled += 1
      super.getPosts()
    }
  }

  class MyPostViewController: PostViewController {

    let expectation = XCTestExpectation(description: "Called")
    var didGetPost = 0
    var didGetError = 0

    override func postPresenter(_ postPresenter: PostPresenter, didGet posts: Posts) {
      didGetPost += 1
      expectation.fulfill()
    }

    override func postPresenter(_ postPresenter: PostPresenter, didGet error: APIError) {
      didGetError += 1
      expectation.fulfill()
    }
  }

  func testPostViewController() {
    let postViewController = MyPostViewController()
    let spy = SpyPostPresenter()
    postViewController.presenter = spy

    // TODO: Should call stub API not call directly to server
    postViewController.viewDidLoad()
    postViewController.viewWillAppear(false)

    wait(for: [postViewController.expectation], timeout: 3)

    XCTAssertEqual(1, spy.getPostsCalled)
    XCTAssertEqual(1, postViewController.didGetPost)
    XCTAssertEqual(0, postViewController.didGetError)
  }

  func testView() {
    [Device.phone4_7inch, Device.phone5_8inch, Device.pad].forEach { device in
      let controller = PostViewController.instantiate()
      let posts: Posts = try! JSONFileReader.readFile(name: "post")
      controller.dataSource.load(posts: posts)
      let (parent, _) = traitControllers(device: device, child: controller)

      FBSnapshotVerifyView(parent.view, identifier: "\(device)")
    }
  }

}
