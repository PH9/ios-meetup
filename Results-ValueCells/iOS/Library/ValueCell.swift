public protocol ValueCell {
  static var reusableId: String { get }
  associatedtype Value: Decodable
  func configuraWith(value: Value)
}

import UIKit

extension UIView {
  public static var reusableId: String {
    return description()
      .components(separatedBy: ".")
      .dropFirst()
      .joined(separator: ".")
  }
}
