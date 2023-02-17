import UIKit

class ChatRequestViewController: UIViewController {
    
    //MARK: - UI Constants
    
    private let chatRequestView = ChatRequestView()
    
    override func loadView() {
        super.loadView()
        view = chatRequestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
