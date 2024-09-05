import Foundation
import UIKit
import SnapKit
import Then
import FSCalendar


class MyPageViewController: UIViewController {
    

    private let rankLabel = UILabel().then {
        $0.text = "🔥대마고 폐급 순위🔥"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 21)
        $0.backgroundColor = .black
        $0.textAlignment = .center
    }
    
    
    
    private let rankTableView = UITableView().then {
        $0.register(RankTableViewCell.self, forCellReuseIdentifier: RankTableViewCell.identifier)
        $0.separatorStyle = .singleLine
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
        [rankLabel, rankTableView].forEach { view.addSubview($0) }
    }
    
    
    func layout() {
        rankLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.width.equalTo(250)
            $0.height.equalTo(50)
        }
        
        rankTableView.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.bottom).offset(20)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
