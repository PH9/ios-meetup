import API

protocol MainPresenterDelegate: class {
  func mainPresenter(_ mainPresenter: MainPresenter, didGet posts: Posts)
  func mainPresenter(_ mainPresenter: MainPresenter, didGet error: APIError)
}

protocol MainPresenterProtocol {
  
  var delete: MainPresenterDelegate? { get }

  func getPosts()
}

class MainPresenter {

  weak var delegate: MainPresenterDelegate?

  func getPosts() {
    WebService.shared.request(PostsRequest()) { [weak self] result in
      guard let s = self else { return }
      switch result {
      case .success(let posts):
        s.delegate?.mainPresenter(s, didGet: posts)
      case .failure(let error):
        s.delegate?.mainPresenter(s, didGet: error)
      }
    }
  }
  
  func getComments(postId: Int) {
    WebService.shared.request(CommentsRequest(postId: postId)) { [weak self] result in
      guard let s = self else { return }
      switch result {
      case .success(let comments):
        // TODO: Hanlde success response
        print(comments)
      case .failure(let error):
        s.delegate?.mainPresenter(s, didGet: error)
      }
    }
  }
}
