import Foundation
import SnapKit
import UIKit
import Then

class BigJuYeongViewController: UIViewController {
    
    let kingLabel = UILabel().then {
        $0.text = " ' 완전 킹정!! '\n- 대 주 영 - "
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
        $0.textColor = .red
        $0.font = .boldSystemFont(ofSize: 33)
    }
    
    let htmlLabel = UILabel().then {
        $0.text = " ' 니미Tlqkf.html ' "
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 30)
    }
    
    let villainLabel = UILabel().then {
        $0.text = " ' 악역은 늘 익숙하니까 '\n- 조커 대주영 -"
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 30)
    }
    
    let powerLabel = UILabel().then {
        $0.text = " ' 큰 힘에는 큰 책임이 따른다 '\n- 친절한 이웃 대주영 - "
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 30)
    }
    
    let peopleLabel = UILabel().then {
        $0.text = " ' 인간 다섯명이 모이면 반드시 한명은 쓰레기가 있다 '\n- 주  멘 - "
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addView()
        layout()
    }
    
    func addView() {
        [
            kingLabel,
            htmlLabel,
            villainLabel,
            powerLabel,
            peopleLabel
            
        ].forEach { view.addSubview($0) }
    }
    
    func layout() {
        kingLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
        }
        
        htmlLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(kingLabel.snp.bottom).offset(20)
        }
        
        villainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(htmlLabel.snp.bottom).offset(20)
        }
        
        powerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(villainLabel.snp.bottom).offset(20)
        }
        
        peopleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(powerLabel.snp.bottom).offset(20)
        }
    }
}
