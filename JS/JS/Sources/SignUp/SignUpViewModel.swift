import Foundation
import UIKit

class SignUpViewModel {
    var onLogin: (() -> Void)?
    var onSignUp: (() -> Void)?
    
    func loginButtonTap() {
        onLogin?()
    }
    
    func signUpButtonTap() {
        onSignUp?()
    }
}
