import UIKit
import API

class MainViewController: UIViewController, MainPresenterDelegate {

  var presenter = MainPresenter()

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.getPosts()
  }

  // MARK: - MainPresenterDelegate
  func mainPresenter(_ mainPresenter: MainPresenter, didGet posts: Posts) {
    // TODO: Show Posts
    print(posts)
  }

  func mainPresenter(_ mainPresenter: MainPresenter, didGet error: APIError) {
    // TODO: Show Error
    print(error)
  }
}
