import UIKit

final class MainTabBarViewController: UITabBarController {
    
    //MARK: - Controllers
    private let peopleViewController = PeopleViewController()
    private let listViewController = ConversationsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(
            named: KeysColor.tabBarColor.rawValue)
        tabBar.backgroundColor = UIColor(
            named: KeysColor.tabBarBackgroundColor.rawValue)
                
        viewControllers = [
            createNavigationVC(
                rootVC: peopleViewController, title: "Контакты",
                imageSystemName: "person.2.fill"),
            createNavigationVC(
                rootVC: listViewController, title: "Диалоги",
                imageSystemName: "message.badge.circle.fill")
        ]
    }
    
    
    private func createNavigationVC(
        rootVC: UIViewController, title: String, imageSystemName: String) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = UIImage(
            systemName: imageSystemName,
            withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
        return navVC
    }
}


