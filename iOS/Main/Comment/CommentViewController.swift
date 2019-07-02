import UIKit
import API

class CommentViewController: UITableViewController {

  var postId: Int = -1
  private var comments = Comments()

  override func viewDidLoad() {
    super.viewDidLoad()

    let request = CommentsRequest(postId: postId)
    WebService.shared.request(request) { result in
      switch result {
      case .success(let comments):
        self.comments = comments
      case .failure(let error):
        // TODO: Handle error
        break
      }
    }
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return comments.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.reusableId, for: indexPath)

    return cell
  }
}
