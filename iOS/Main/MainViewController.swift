import UIKit
import API

class MainViewController: UITableViewController, MainPresenterDelegate {

  var presenter = MainPresenter()
  private var dataSource = MainViewDataSource()

  private var posts = Posts()

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.delegate = self
    tableView.dataSource = dataSource
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.getPosts()
  }

  // MARK: - MainPresenterDelegate
  func mainPresenter(_ mainPresenter: MainPresenter, didGet posts: Posts) {
    self.posts = posts
    dataSource.load(posts: posts)
    tableView.reloadData()
  }

  func mainPresenter(_ mainPresenter: MainPresenter, didGet error: APIError) {
    // TODO: Show Error
    print(error)
  }
}
