import UIKit
import API

class CommentTableViewCell: UITableViewCell, ValueCell {

  @IBOutlet weak var commentLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!

  func configuraWith(value: Comment) {
    commentLabel.text = value.body
    nameLabel.text = value.name
  }
}
