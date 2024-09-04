//
//  ViewController.swift
//  JS
//
//  Created by 이지훈 on 9/4/24.
//

import UIKit
import Foundation
import SnapKit
import Then

class MainTabVarViewController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: TabBarMyPageViewController())
        
        
        
        setViewControllers([vc1, vc2], animated: true)
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "person")

        
    }


}

