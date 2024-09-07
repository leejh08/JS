import Foundation

class InfoViewModel {
    var goInfo: (() -> Void)?
    
    func myPageButtonTap() {
        
        goInfo?()
    }
}
