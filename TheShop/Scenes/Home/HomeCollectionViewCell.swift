import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	
	static let identifier: String = "HomeCollectionViewCell"
	
	lazy var borderView: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.cornerRadius = 16
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.backgroundColor = UIColor.white.cgColor
		$0.layer.borderWidth = 2
		
		$0.layer.shadowOffset = CGSize(width: 3, height: 4)
		$0.layer.shadowRadius = 0
		$0.layer.shadowOpacity = 1
		return $0
	}(UIView())
	
	lazy var nameLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .lightGray
		$0.numberOfLines = 0
		return $0
	}(UILabel())
	
	lazy var priceLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .lightGray
		$0.numberOfLines = 0
		$0.text = "R$ 0,00"
		return $0
	}(UILabel())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.contentView.addSubview(nameLabel)
		self.contentView.addSubview(borderView)
		self.contentView.addSubview(priceLabel)
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			borderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
			borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
			borderView.heightAnchor.constraint(equalToConstant: 180),
			
			nameLabel.topAnchor.constraint(equalTo: borderView.bottomAnchor, constant: 5),
			nameLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 5),
			nameLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -5),
			
			priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
			priceLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 5),
			priceLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -5),
			
		])
	}
}
