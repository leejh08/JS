import Foundation
import UIKit
import SnapKit
import Then
import FSCalendar



class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let jsLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 45)
        $0.textAlignment = .center
        $0.text = "JS"
        $0.textColor = .darkGray
    }
    
    private let calendar: FSCalendar = FSCalendar(frame: .zero).then {
        $0.headerHeight = 44
    }
    
    private let yearLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: .zero)
    }
    
    private lazy var beforeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.addTarget(self, action: #selector(prevCurrentPage), for: .touchUpInside)
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.addTarget(self, action: #selector(nextCurrentPage), for: .touchUpInside)
    }
    
    private var currentPage: Date?
    private let today: Date = Date()
    
    @objc private func nextCurrentPage() {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.weekOfMonth = 1
        
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        if let currentPage = self.currentPage {
            self.calendar.setCurrentPage(currentPage, animated: true)
        }
    }
    
    @objc private func prevCurrentPage() {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.weekOfMonth = -1
        
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        if let currentPage = self.currentPage {
            self.calendar.setCurrentPage(currentPage, animated: true)
        }
    }
    
    private let suggestionButton = UIButton().then {
        $0.setTitle("날짜 선택", for: .normal)
        $0.tintColor = .white
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
    }
    
    private let daysLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    private let datePicker = UIDatePicker().then {
        $0.datePickerMode = .date
        $0.preferredDatePickerStyle = .wheels
        $0.maximumDate = Date()
    }
    
    private let rankTableView = UITableView().then {
        $0.register(RankTableViewCell.self, forCellReuseIdentifier: RankTableViewCell.identifier)
    }
    
    private let rankLabel = UILabel().then {
        $0.text = ""
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private var selectedDate: Date?
    private var daysPassed: Int = 0
    private var hoursPassed: Int = 0
    let names = ["김주영", "김주영", "김주영", "김주영", "김주영"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "공부 좀 해라"
        
        navigationItem.hidesBackButton = true

        [
            jsLabel,
            suggestionButton,
            daysLabel,
            rankTableView,
            calendar,
            yearLabel,
            beforeButton,
            nextButton,
            rankLabel
        ].forEach { view.addSubview($0) }
        
        setupConstraints()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        suggestionButton.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
        
        rankTableView.dataSource = self
        rankTableView.delegate = self
        
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    private func setupConstraints() {
        jsLabel.snp.makeConstraints {
            $0.top.equalTo(80)
            $0.left.equalToSuperview().inset(20)
        }
        
        yearLabel.snp.makeConstraints {
            $0.top.equalTo(jsLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        suggestionButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(yearLabel.snp.bottom).offset(10)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        
        daysLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(suggestionButton.snp.bottom).offset(20)
        }
        
        calendar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(daysLabel.snp.bottom).offset(10)
            $0.height.equalTo(300)
        }
        
        rankTableView.snp.makeConstraints {
            $0.top.equalTo(calendar.snp.bottom).offset(20)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(beforeButton.snp.top).offset(-20)
        }
        
        beforeButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        nextButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        rankLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(rankTableView.snp.bottom).offset(20)
        }
    }
    
    @objc private func showDatePicker() {
        let alert = UIAlertController(title: "날짜 선택", message: nil, preferredStyle: .actionSheet)
        
        let pickerFrame = CGRect(x: 0, y: 50, width: alert.view.frame.width - 20, height: 200)
        datePicker.frame = pickerFrame
        alert.view.addSubview(datePicker)
        
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 350)
        alert.view.addConstraint(height)
        
        let selectAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.selectedDate = self.datePicker.date
            self.updateDaysLabel()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(selectAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func updateDaysLabel() {
        guard let selectDate = selectedDate else {
            daysLabel.text = "날짜를 선택하세요"
            return
        }
        
        let currentDate = Date()
        let dateComponents = Calendar.current.dateComponents([.day], from: selectDate, to: currentDate)
        daysPassed = dateComponents.day ?? 0
        hoursPassed = daysPassed * 24
        
        daysLabel.text = "\(daysPassed)일 동안 자습함"
        
        rankTableView.reloadData()
        
        let detailVC = TimeViewController()
        detailVC.hoursPassed = hoursPassed
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankTableViewCell.identifier, for: indexPath) as? RankTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .white
        
        let rank = indexPath.row + 1
        let name = names[indexPath.row]
        cell.configure(rank: rank, name: name, daysPassed: daysPassed)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        yearLabel.text = DateFormatter.localizedString(from: calendar.currentPage, dateStyle: .medium, timeStyle: .none)
    }
}
