import Foundation

class InfoViewModel {
    var onSignUp: (() -> Void)?
    
    func signUpButtonTap() {
        
        onSignUp?()
    }
}
