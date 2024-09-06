import UIKit
import Foundation
import SnapKit
import Then

class MainTabVarViewController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: TodoListViewController())
        let vc2 = UINavigationController(rootViewController: HomeViewController())
        let vc3 = UINavigationController(rootViewController: MyPageViewController())
        
        
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard")
        vc2.tabBarItem.image = UIImage(systemName: "house")
        vc3.tabBarItem.image = UIImage(systemName: "person")

        
    }


}

