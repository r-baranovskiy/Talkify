import Foundation

protocol ConfiguringCell {
    static var reuseID: String { get }
    func configure<U: Hashable>(with value: U)
}
