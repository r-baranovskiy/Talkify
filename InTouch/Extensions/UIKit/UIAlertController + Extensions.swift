import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, completion: @escaping () -> Void = { }) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { _ in
            completion()
        }
        controller.addAction(action)
        present(controller, animated: true)
    }
}
