import UIKit

enum ListSection: Int, CaseIterable {
    case waitingChat
    case activeChats
    
    func description() -> String {
        switch self {
        case .waitingChat:
            return "Ожидают подтверждения"
        case .activeChats:
            return "Ваши контакты"
        }
    }
}

enum PeopleSection: Int, CaseIterable {
    case users
    
    func description(usersCount: Int) -> String {
        switch self {
        case .users:
            
            switch usersCount {
            case 0: return "Поблизости никого нет"
            case 1: return "1 человек рядом"
            case 2...: return "\(usersCount) людей рядом"
            default:
                return "Количество неизвестно"
            }
        }
    }
}
