import Foundation
import UIKit
import SnapKit
import Then



class HomeViewController: UIViewController {
    
    private let suggestionButton = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.tintColor = .red
        $0.backgroundColor = .black
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "홈"
        [suggestionButton].forEach { view.addSubview($0) }
        layout()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        }
    
        
    func layout() {
        suggestionButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        }
        
    }
    
    

