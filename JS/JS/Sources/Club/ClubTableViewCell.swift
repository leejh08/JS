import UIKit
import SnapKit
import Then

class ClubTableViewCell: UITableViewCell {
    
    
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    
    private let descriptionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(descriptionLabel)
    }
    
    
    private func setupLayout() {
        logoImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(16)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    
    func configure(imageName: String, description: String) {
        logoImageView.image = UIImage(named: imageName)
        descriptionLabel.text = description
    }
}
