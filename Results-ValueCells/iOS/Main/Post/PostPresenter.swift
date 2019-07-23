import API

protocol PostPresenterDelegate: class {
  func postPresenter(_ postPresenter: PostPresenter, didGet posts: Posts)
  func postPresenter(_ postPresenter: PostPresenter, didGet error: APIError)
}

class PostPresenter {

  weak var delegate: PostPresenterDelegate?

  func getPosts() {
    WebService.shared.request(PostsRequest()) { [weak self] result in
      guard let s = self else { return }
      switch result {
      case .success(let posts):
        s.delegate?.postPresenter(s, didGet: posts)
      case .failure(let error):
        s.delegate?.postPresenter(s, didGet: error)
      }
    }
  }

  func showCommentViewController(postId: Int) {

  }
}
