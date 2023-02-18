import UIKit

struct Chat: Hashable {
    let username: String
    let userImage: UIImage
    let lastMessge: String
    let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
}
