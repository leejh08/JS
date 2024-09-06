import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class MyPageViewController: UIViewController {
    
    private let viewModel = InfoViewModel()
    private let disposeBag = DisposeBag()
    
    
    private let jsLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 45)
        $0.textAlignment = .center
        $0.text = "JS"
        $0.textColor = .darkGray
    }
    
    private let personButton = UIButton().then {
        let image = UIImage(systemName: "person.crop.circle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 40, weight: .regular))
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    
    private let rankLabel = UILabel().then {
        $0.text = "🔥TIL🔥"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 21)
        $0.backgroundColor = .white
        $0.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = "마이페이지"
        
        addView()
        layout()
        setupBindings()
    }
    
    private func setupBindings() {
        personButton.rx.tap
            .bind { [weak self] in
                print("Person button tapped")
                self?.viewModel.signUpButtonTap()
            }
            .disposed(by: disposeBag)
        
        viewModel.onSignUp = { [weak self] in
            print("onSignUp called")
            let infoViewController = PersonInfoViewController()
            self?.navigationController?.pushViewController(infoViewController, animated: true)
        }
    }
    
    func addView() {
        [rankLabel, jsLabel, personButton].forEach { view.addSubview($0) }
    }
    
    func layout() {
        rankLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.width.equalTo(250)
            $0.height.equalTo(50)
        }
        
        jsLabel.snp.makeConstraints {
            $0.top.equalTo(50)
            $0.right.equalToSuperview().inset(325)
        }
        
        personButton.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.right.equalToSuperview().inset(10)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
    }
}
