import Foundation
import SnapKit
import UIKit
import Then
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    
    
    private let viewModel = SignUpViewModel()
    private let disposeBag = DisposeBag()
    
    private let welcomeLabel = UILabel().then {
        $0.text = "어서와 자습은 처음이지?"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 35)
    }
    
    
    private let logoLabel = UILabel().then {
        $0.text = "JS"
        $0.textColor = .white
        $0.font = .italicSystemFont(ofSize: 48)
    }
    
    private let emailTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력하세요", attributes: [.foregroundColor: UIColor.black])
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
    
    private let PhoneTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "전화번호를 입력하세요", attributes: [.foregroundColor: UIColor.black])
        $0.keyboardType = .emailAddress
        $0.font = .systemFont(ofSize: 20)
        $0.backgroundColor = .white
        $0.font = .italicSystemFont(ofSize: 15)
        $0.layer.cornerRadius = 15
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
    }
    
    private let alreadySignUp = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    private let SignUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        addview()
        layout()
        setupBindings() 
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.hidesBackButton = true
    }
    
    
    private func setupBindings() {
        
        SignUpButton.rx.tap
            .bind { [weak self] in
                self?.viewModel.signUpButtonTap()
            }
            .disposed(by: disposeBag)
        
        
        alreadySignUp.rx.tap
            .bind { [weak self] in
                self?.viewModel.loginButtonTap()
            }
            .disposed(by: disposeBag)
        
        
        viewModel.onSignUp = { [weak self] in
            let homeViewController = MainTabVarViewController()
            self?.navigationController?.pushViewController(homeViewController, animated: true)
        }
        
        
        viewModel.onLogin = { [weak self] in
            let loginViewController = LoginViewController()
            self?.navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
    
    func addview() {
        [
            welcomeLabel,
            logoLabel,
            emailTextField,
            passWordTextField,
            PhoneTextField,
            SignUpButton,
            alreadySignUp
        ].forEach { view.addSubview($0) }
    }
    
    func layout() {
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(125)
        }
        
        logoLabel.snp.makeConstraints {
        $0.centerX.equalToSuperview()
            $0.top.equalTo(250)
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
        
        PhoneTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passWordTextField.snp.bottom).offset(40)
            $0.width.equalToSuperview().inset(25)
            $0.height.equalTo(56)
        }
        
        alreadySignUp.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(PhoneTextField.snp.bottom).offset(110)
        }
        
        SignUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(PhoneTextField.snp.bottom).offset(160)
            $0.width.equalToSuperview().inset(24)
            $0.height.equalTo(56)
        }
    }
}
