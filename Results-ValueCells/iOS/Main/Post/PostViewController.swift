import UIKit
import API

class PostViewController: UITableViewController, PostPresenterDelegate {

  var presenter = PostPresenter()
  var dataSource = PostViewDataSource()

  private var posts = Posts()

  static func instantiate() -> PostViewController {
    return UIStoryboard(name: "Post", bundle: nil).instantiateInitialViewController()! as! PostViewController
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.delegate = self
    tableView.dataSource = dataSource
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.getPosts()
  }

  // MARK: - PostPresenterDelegate
  func postPresenter(_ postPresenter: PostPresenter, didGet posts: Posts) {
    self.posts = posts
    dataSource.load(posts: posts)
    tableView.reloadData()
  }

  func postPresenter(_ postPresenter: PostPresenter, didGet error: APIError) {
    // TODO: Show Error
    print(error)
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    presenter.showCommentViewController(postId: dataSource[indexPath])
  }
}
