import Foundation

protocol ConfiguringCell {
    static var reuseID: String { get }
    func configure(with value: Chat)
}
