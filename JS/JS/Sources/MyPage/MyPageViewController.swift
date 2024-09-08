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
        $0.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    
    
    private let todayLabel = UILabel().then {
        $0.text = "오늘의 명언🔥"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 30)
        $0.backgroundColor = .white
        $0.textAlignment = .center
    }
    
    private let wiseSayingLabel = UILabel().then {
        $0.text = "상황을 가장 잘 활용하는 사람이 가장 좋은 상황을 맞는다.\n- 존 우든 -"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .italicSystemFont(ofSize: 16)
    }
    
    
    private let sayings = [
        "상황을 가장 잘 활용하는 사람이 가장 좋은 상황을 맞는다.\n- 존 우든 -",
        "성공은 매일 반복한 작은 노력들의 합이다.\n- 로버트 콜리어 -",
        "변화는 고통스럽다. 그러나 그 고통 덕분에 성장이 있다.\n- 존 맥스웰 -",
        "실패는 성공을 위한 디딤돌이다.\n- 아놀드 팔머 -",
        "위대한 일을 하기 위해서는 열정을 가져야 한다.\n– 데니스 디드로 -",
        "성공은 열정을 잃지 않고 실패에서 실패로 걸어가는 것이다.\n– 윈스턴 처칠 - ",
        "작은 기회로부터 종종 위대한 업적이 시작된다.\n– 데모스테네스 -",
        "열정 없이 위대한 성과를 이룰 수 없다.\n– 랄프 왈도 에머슨 -",
        "한 사람의 열정은 한 번의 큰 기회를 만든다.\n– 윌리엄 셰익스피어 -",
        "열정이 당신을 앞으로 나아가게 하는 연료다.\n– 토니 로빈스 -"
    ]
    
    
    private let randomButton = UIButton().then {
        let image = UIImage(systemName: "arrow.clockwise")
        $0.setImage(image, for: .normal)
        $0.tintColor = .black
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        
        
        let personBarButtonItem = UIBarButtonItem(customView: personButton)
        navigationItem.rightBarButtonItem = personBarButtonItem
        title = "마이페이지"
        
        addView()
        layout()
        setupBindings()
    }
    
    private func setupBindings() {
        personButton.addTarget(self, action: #selector(handlePersonButtonTap), for: .touchUpInside)
        
        
        
        
        randomButton.rx.tap
            .bind { [weak self] in
                guard let self = self else { return }
                let randomIndex = Int.random(in: 0..<self.sayings.count)
                self.wiseSayingLabel.text = self.sayings[randomIndex]
            }
            .disposed(by: disposeBag)
    }
    
    
    @objc private func handlePersonButtonTap() {
        print("Person button tapped")
        let infoViewController = PersonInfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    
    
    func addView() {
        [
            todayLabel,
            jsLabel,
            personButton,
            wiseSayingLabel,
            randomButton
        ].forEach { view.addSubview($0) }
    }
    
    func layout() {
        todayLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.width.equalTo(250)
            $0.height.equalTo(50)
        }
        
        jsLabel.snp.makeConstraints {
            $0.top.equalTo(80)
            $0.right.equalToSuperview().inset(325)
        }
        
        
        
        wiseSayingLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(todayLabel.snp.bottom).offset(50)
        }
        
        
        randomButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(wiseSayingLabel.snp.bottom).offset(30)
        }
    }
    
}

