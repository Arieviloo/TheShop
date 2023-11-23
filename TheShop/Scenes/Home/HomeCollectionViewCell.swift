import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	
	static let identifier: String = "HomeCollectionViewCell"
	
	lazy var nameLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .lightGray
		return $0
	}(UILabel())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.contentView.addSubview(nameLabel)
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
		])
	}
}
