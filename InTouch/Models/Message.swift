import UIKit

struct Message: Hashable {
    var username: String
    var userImage: UIImage
    var lastMessge: String
    var id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
}
