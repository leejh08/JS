import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = LoginViewModel()
    
    private let logoLabel = UILabel().then {
        $0.text = "JS"
        $0.textColor = .white
        $0.font = .italicSystemFont(ofSize: 48)
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "어서와 자습은 오랜만이지?"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 35)
    }
    
    private let loginTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "아이디를 입력하세요", attributes: [.foregroundColor: UIColor.black])
        $0.keyboardType = .emailAddress
        $0.font = .systemFont(ofSize: 20)
        $0.backgroundColor = .white
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
        $0.backgroundColor = .white
        $0.font = .italicSystemFont(ofSize: 15)
        $0.layer.cornerRadius = 15
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }
    
    private let goSignUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        addView()
        layout()
        
        setupBindings()
    }
    
    private func setupBindings() {
        loginButton.rx.tap
            .bind { [weak self] in
                self?.viewModel.loginButtonDidTap()
            }
            .disposed(by: disposeBag)
        
        goSignUpButton.rx.tap
            .bind { [weak self] in
                self?.viewModel.signUpButtonDidTap()
            }
            .disposed(by: disposeBag)
        
        
        viewModel.onLogin = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        viewModel.onSignUp = { [weak self] in
            let signUpViewController = SignUpViewController()
            self?.navigationController?.pushViewController(signUpViewController, animated: true)
        }
    }
    
    func addView() {
        [
            logoLabel,
            welcomeLabel,
            loginTextField,
            passWordTextField,
            loginButton,
            goSignUpButton
        ].forEach { view.addSubview($0) }
    }
    
    
    
    func layout() {
            logoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
                $0.top.equalTo(250)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(125)
        }
        
        loginTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoLabel.snp.bottom).offset(60)
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
            $0.top.equalTo(passWordTextField.snp.bottom).offset(220)
        }

        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passWordTextField.snp.bottom).offset(270)
            $0.width.equalToSuperview().inset(24)
            $0.height.equalTo(56)
        }
    }
}

