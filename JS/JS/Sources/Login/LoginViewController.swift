import Foundation
import UIKit
import SnapKit
import Then



class LoginViewController: UIViewController {
    
    private let viewModel = LoginViewModel()
    
    
    private let logoImageVIew = UIImageView().then {
        $0.image = .logo
    }
    
    
    private let welcomeLabel = UILabel().then {
        $0.text = "어서와 자습은 오랜만이지?"
        $0.textColor = .lightGray
        $0.font = .boldSystemFont(ofSize: 35)
    }
    
    private let loginTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "아이디를 입력하세요", attributes: [.foregroundColor: UIColor.black])
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
    
    private let goSignUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .lightGray
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(loginButtontap), for: .touchUpInside)
    }
    
    
    @objc func loginButtontap(){
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
        print("로그인 버튼 tap")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addView()
        layout()
    }
    
    
    func addView() {
        [
            logoImageVIew,
            welcomeLabel,
            loginTextField,
            passWordTextField,
            loginButton,
            goSignUpButton
            
        ].forEach{view.addSubview($0)}
    }
    
    
    
    
    func layout() {
        logoImageVIew.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(69)
        }
        
        
        loginTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageVIew.snp.bottom).offset(60)
            $0.width.equalToSuperview().inset(25)
            $0.height.equalTo(56)
        }
        
        passWordTextField.snp.makeConstraints {
            
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginTextField.snp.bottom).offset(25)
            $0.width.equalToSuperview().inset(25)
            $0.height.equalTo(56)
            
        }
        
        goSignUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passWordTextField.snp.bottom).offset(230)
        }

        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passWordTextField.snp.bottom).offset(290)
            $0.width.equalToSuperview().inset(24)
            $0.height.equalTo(56)
        }
    }
}


