import Foundation
import UIKit
import SnapKit
import Then
import FSCalendar


class MyPageViewController: UIViewController {
    
    
    
    private let jsLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 45)
        $0.textAlignment = .center
        $0.text = "JS"
        $0.textColor = .darkGray
    }
    

    private let rankLabel = UILabel().then {
        $0.text = "🔥TIL🔥"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 21)
        $0.backgroundColor = .black
        $0.textAlignment = .center
    }
    
    
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "마이페이지"
 
        addView()
        layout()
    }
    
    
    func addView() {
        [
            rankLabel,
            jsLabel
            
        ].forEach { view.addSubview($0) }
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
        
      
    }
    
}
