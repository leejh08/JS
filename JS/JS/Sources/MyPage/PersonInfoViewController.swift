import UIKit
import Foundation
import Then
import SnapKit

class PersonInfoViewController: UIViewController {

    private let tableView = UITableView()
    
    private var myOneSo = ["로그아웃", "회원탈퇴", "자습 탈출", "대주영 어록"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
    }
}

extension PersonInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOneSo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        cell.saveData(with: myOneSo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedcell = myOneSo[indexPath.row]

        let alertController = UIAlertController(title: selectedcell, message: "\(selectedcell)을(를) 하실건가요?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            switch selectedcell {
            case "로그아웃":
                let loginViewController = LoginViewController()
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(loginViewController, animated: true)
            case "회원탈퇴":
                let signUpViewController = SignUpViewController()
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(signUpViewController, animated: true)
            case "자습 탈출":
                let escapeStudyViewController = EscapeStudyViewController()
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(escapeStudyViewController, animated: true)
            case "대주영 어록":
                let BigViewController = BigJuYeongViewController()
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(BigViewController, animated: true)
            default:
                break
            }
        }

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
