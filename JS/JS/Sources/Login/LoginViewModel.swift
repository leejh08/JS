import Foundation
import UIKit

class LoginViewModel {
    func loginButtonDidTap() {
        print("asdfghj")
    }
    
    @objc func signinButtonDidTap() {
        UINavigationController(rootViewController: SignUpViewController())
    }
}
