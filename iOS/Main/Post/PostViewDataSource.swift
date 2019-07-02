import UIKit
import API

internal final class PostViewDataSource: ValueCellDataSource {

  internal enum Section: Int {
    case posts
  }

  internal func load(posts: Posts) {
    let section = Section.posts.rawValue

    posts.forEach { post in
      appendRow(value: post, cellClass: PostTableViewCell.self, toSection: section)
    }
  }

  override func configure(cell: UITableViewCell, with value: Any) {
    switch (cell, value) {
    case let (cell as PostTableViewCell, post as Post):
      cell.configuraWith(value: post)
    default:
      assertionFailure("Unknow combo: \(cell), \(value)")
    }
  }
}
