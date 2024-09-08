import UIKit
import SnapKit
import Then

class TimeViewController: UIViewController {

    var hoursPassed: Int = 0
    private let hoursLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.textColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "몇시간을 JS했을까?"
        view.backgroundColor = .white

        
        view.addSubview(hoursLabel)
        layout()
        
        hoursLabel.text = "\(hoursPassed)시간 동안 JS함"
    }
    
    
    func layout() {
        hoursLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
