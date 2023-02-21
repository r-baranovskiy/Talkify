import Foundation

struct Chat: Hashable, Decodable {
    let username: String
    let userImageString: String
    let lastMessage: String
    let id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
}
