import Foundation
import UIKit
import SnapKit
import Then




class TodoListViewController: UIViewController {
    
    let jsLabel = UILabel().then {
        
        $0.font = .boldSystemFont(ofSize: 45)
        $0.textAlignment = .center
        $0.text = "JS"
        $0.textColor = .darkGray
    }
    
    
    override func viewDidLoad() {
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = "ToDoList"
        addview()
        layout()
    }
    
    
    func addview() {
        [
            jsLabel
            
        ].forEach { view.addSubview($0) }
        
    }
    
    func layout() {
        jsLabel.snp.makeConstraints {
            $0.top.equalTo(50)
            $0.right.equalToSuperview().inset(325)
        }
        
    }
    
    
    
    
}



