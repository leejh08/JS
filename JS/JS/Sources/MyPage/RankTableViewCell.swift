import UIKit
import SnapKit
import Then

class RankTableViewCell: UITableViewCell {
    static let identifier = "RankTableViewCell"
    
    
    private let rankLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }

    private let daysPassedLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.textAlignment = .right
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViews() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(daysPassedLabel)
    }
    
    
    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(rankLabel.snp.right).offset(16)
            $0.centerY.equalToSuperview()
        }
        
        daysPassedLabel.snp.makeConstraints {
            $0.right.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    
    func configure(rank: Int, name: String, daysPassed: Int) {
        rankLabel.text = "\(rank)위"
        nameLabel.text = name
        daysPassedLabel.text = "\(daysPassed)일"
    }
}
