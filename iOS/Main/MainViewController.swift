import UIKit
import API

class MainViewController: UITableViewController, MainPresenterDelegate {

  var presenter = MainPresenter()

  private var posts = Posts()

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
    self.posts = posts
    tableView.reloadData()
  }

  func mainPresenter(_ mainPresenter: MainPresenter, didGet error: APIError) {
    // TODO: Show Error
    print(error)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
    cell.configuraWith(value: posts[indexPath.row])
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // TODO: Show more details
  }
}
