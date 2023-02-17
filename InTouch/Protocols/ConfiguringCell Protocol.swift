import Foundation

protocol SelfConfiguringCell {
    static var reuseID: String { get }
    func configure<U: Hashable>(with value: U)
}
