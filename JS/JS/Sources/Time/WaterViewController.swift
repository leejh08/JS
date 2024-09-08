import UIKit

class WaterViewController: UIViewController {

    
    private let hanRiver = UILabel().then {
        $0.text = "지금 한강은 27.8"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 40)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "풍덩"
        view.backgroundColor = .systemBackground
        addview()
        layout()
    }
    
    func addview() {
        [
            hanRiver
            
        ].forEach { view.addSubview($0) }
    }
    
    
    func layout() {
        hanRiver.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(260)
        }
    }
    
}
