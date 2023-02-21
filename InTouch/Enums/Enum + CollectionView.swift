import UIKit

enum ListSection: Int, CaseIterable {
    case waitingChat
    case activeChat
    
//    func description() -> String {
//        switch self {
//        case .activeChat:
//            return "Ваши контакты"
//        case .waitingChat:
//            return "Ожидают подтверждения"
//        }
//    }
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
