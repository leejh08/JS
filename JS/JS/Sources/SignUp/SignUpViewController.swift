import Foundation
import SnapKit
import UIKit
import Then


class SignUpViewController: UIViewController {
    
    private let welcomeLabel = UILabel().then {
        $0.text = "어서와 자습은 처음이지?"
        $0.textColor = .lightGray
        $0.font = .boldSystemFont(ofSize: 35)
    }
    
    private let emailTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력하세요", attributes: [.foregroundColor: UIColor.black])
        $0.keyboardType = .emailAddress
        $0.font = .systemFont(ofSize: 20)
        $0.backgroundColor = .lightGray
        $0.font = .italicSystemFont(ofSize: 15)
        $0.layer.cornerRadius = 15
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }
    
    private let passWordTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력하세요", attributes: [.foregroundColor: UIColor.black])
        $0.keyboardType = .emailAddress
        $0.font = .systemFont(ofSize: 20)
        $0.backgroundColor = .lightGray
        $0.font = .italicSystemFont(ofSize: 15)
        $0.layer.cornerRadius = 15
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }
    
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        addview()
        layout()
        
    }
    
    
    func addview() {
        [
            welcomeLabel,
            emailTextField,
            passWordTextField
            
        ].forEach{view.addSubview($0)}
        
    }
    
    
    func layout() {
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(69)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(190)
            $0.width.equalToSuperview().inset(25)
            $0.height.equalTo(56)
        }
        
        passWordTextField.snp.makeConstraints {
            
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.width.equalToSuperview().inset(25)
            $0.height.equalTo(56)
            
        }
        
        
    }
}
