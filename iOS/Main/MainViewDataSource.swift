import UIKit
import API

internal final class MainViewDataSource: ValueCellDataSource {

  internal enum Section: Int {
    case posts
  }

  internal func load(posts: Posts) {
    let section = Section.posts.rawValue

    posts.forEach { post in
      appendRow(value: post, cellClass: PostCell.self, toSection: section)
    }
  }

  override func configure(cell: UITableViewCell, with value: Any) {
    switch (cell, value) {
    case let (cell as PostCell, post as Post):
      cell.configuraWith(value: post)
    default:
      assertionFailure("Unknow combo: \(cell), \(value)")
    }
  }
}
