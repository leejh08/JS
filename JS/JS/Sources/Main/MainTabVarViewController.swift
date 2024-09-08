import UIKit
import Foundation
import SnapKit
import Then

class MainTabVarViewController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        
        view.backgroundColor = .systemBackground
        
        
        let vc1 = UINavigationController(rootViewController: TodoListViewController())
        let vc2 = UINavigationController(rootViewController: WaterViewController())
        let vc3 = UINavigationController(rootViewController: HomeViewController())
        let vc4 = UINavigationController(rootViewController: ClubViewController())
        let vc5 = UINavigationController(rootViewController: MyPageViewController())
        
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        
        vc1.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard")
        vc2.tabBarItem.image = UIImage(systemName: "drop.fill")
        vc3.tabBarItem.image = UIImage(systemName: "house")
        vc4.tabBarItem.image = UIImage(systemName: "figure.wave")
        vc5.tabBarItem.image = UIImage(systemName: "person")

        
    }


}

