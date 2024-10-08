import Foundation
import UIKit

class LoginViewModel {
    var onLogin: (() -> Void)?
    var onSignUp: (() -> Void)?
    
    func loginButtonDidTap() {
        onLogin?()
    }
    
    func signUpButtonDidTap() {
        onSignUp?()
    }
}
