import UIKit
import SnapKit
import Then
import Foundation


class EscapeStudyViewController: UIViewController {
    
    let happyLabel = UILabel().then {
        $0.text = "사람이 언제 죽는다고 생각하나···?\n심장이 총알에 뚫렸을 때···?\n ···아니.불치의 병에 걸렸을 때?\n ···아니.맹독 버섯 스프를 마셨을 때···?\n아니야!!!···사람들에게서 잊혀졌을 때다···!!!\n- Dr.대주영 -"
        $0.font = .monospacedDigitSystemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
    }
    
    let celebrateLabel = UILabel().then {
        $0.text = "Good Bye 'JS'"
        $0.font = .boldSystemFont(ofSize: 35)
        $0.textColor = .black
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        addView()
        layout()
    }
    
    
    func addView() {
        [
           happyLabel,
           celebrateLabel
           
        ].forEach { view.addSubview($0) }
    }
    
    func layout() {
        happyLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        celebrateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(happyLabel.snp.bottom).offset(30)
        }
    }
}
