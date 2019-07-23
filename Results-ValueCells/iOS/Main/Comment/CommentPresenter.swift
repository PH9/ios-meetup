import API

protocol CommentPresenterDelegate: class {
  func commentPresenter(_ presenter: CommentPresenter, didGet comments: Comments)
  func commentPresenter(_ presenter: CommentPresenter, didGet error: APIError)
}

class CommentPresenter {

  weak var delegate: CommentPresenterDelegate?

  func getComments(postId: Int) {
    WebService.shared.request(CommentsRequest(postId: postId)) { [weak self] result in
      guard let s = self else { return }
      switch result {
      case .success(let comments):
        s.delegate?.commentPresenter(s, didGet: comments)
      case .failure(let error):
        s.delegate?.commentPresenter(s, didGet: error)
      }
    }
  }
}
