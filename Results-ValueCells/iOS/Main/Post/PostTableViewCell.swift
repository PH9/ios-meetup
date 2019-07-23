import UIKit
import API

class PostTableViewCell: UITableViewCell, ValueCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    bodyLabel.text = nil
  }

  func configuraWith(value: Post) {
    titleLabel.text = value.title
    bodyLabel.text = value.body
  }
}
