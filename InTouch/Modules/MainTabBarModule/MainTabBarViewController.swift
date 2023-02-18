import UIKit

final class MainTabBarViewController: UITabBarController {
    
    //MARK: - Controllers
    private let peopleViewController = PeopleViewController()
    private let listViewController = ListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tabBar.tintColor = UIColor(
        //            named: KeysColor.tabBarColor.rawValue)
        tabBar.backgroundColor = UIColor.CustomColor.tabBarBackground.color
        viewControllers = [
            createNavigationVC(
                rootVC: listViewController, title: "Диалоги",
                imageSystemName: "message.badge.circle.fill"),
            createNavigationVC(
                rootVC: peopleViewController, title: "Контакты",
                imageSystemName: "person.2.fill")
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


