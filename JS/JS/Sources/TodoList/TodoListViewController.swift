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

    let tableView = UITableView()
    var todos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "ToDoList"
        
        addview()
        layout()
        setupTableView()
        setupNavigationBar()
    }

    
    func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
        addButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = addButton
    }

    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "TodoTableViewCell")
    }

    
    @objc func addTodo() {
        let alert = UIAlertController(title: "오늘의 할 것", message: "할 것을 추가하세요", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "what are you doing?"
        }

        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let todoText = alert.textFields?.first?.text, !todoText.isEmpty {
                self.todos.append(todoText)
                self.tableView.reloadData()
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(addAction)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
    }

    
    func addview() {
        [
            jsLabel,
            tableView
        
        ].forEach { view.addSubview($0) }
    }

    
    func layout() {
        jsLabel.snp.makeConstraints {
            $0.top.equalTo(80)
            $0.right.equalToSuperview().inset(325)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(jsLabel.snp.bottom).offset(20)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}


extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as? TodoTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: todos[indexPath.row])
        return cell
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
