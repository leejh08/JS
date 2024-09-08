import UIKit
import SnapKit
import Then

class ClubViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private let clubs = [
        (imageName: "Pick", description: "PICK"),
        (imageName: "Dms", description: "DMS"),
        (imageName: "deadong", description: "대동여지도"),
        (imageName: "gram", description: "GRAM"),
        (imageName: "info", description: "Info"),
        (imageName: "nonamed", description: "NoNamed"),
        (imageName: "exit", description: "EXIT"),
        (imageName: "modeep", description: "Modeep"),
    ]
    
    
    private let tableView = UITableView().then {
        $0.register(ClubTableViewCell.self, forCellReuseIdentifier: "ClubCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "동아리"
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        addView()
        layOut()
    }
    
    
    func addView() {
        view.addSubview(tableView)
    }
    
    
    func layOut() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClubCell", for: indexPath) as? ClubTableViewCell else {
            return UITableViewCell()
        }
        
        let club = clubs[indexPath.row]
        cell.configure(imageName: club.imageName, description: club.description)
        
        return cell
    }
    

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
