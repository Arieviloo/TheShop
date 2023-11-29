import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	
	static let identifier: String = "HomeCollectionViewCell"
	
	lazy var cardBorderView: UIImageView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.cornerRadius = 16
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.backgroundColor = UIColor.white.cgColor
		$0.layer.borderWidth = 2
		$0.layer.shadowOffset = CGSize(width: 3, height: 4)
		$0.layer.shadowRadius = 1
		$0.layer.shadowOpacity = 1
		return $0
	}(UIImageView())
	
	lazy var imageProductView: UIImageView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 16
		$0.contentMode = .scaleAspectFit
		return $0
	}(UIImageView())
	
	lazy var nameLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.numberOfLines = 3
		return $0
	}(UILabel())
	
	lazy var priceLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .lightGray
		$0.numberOfLines = 0
		return $0
	}(UILabel())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.contentView.addSubview(cardBorderView)
		self.cardBorderView.addSubview(imageProductView)
		self.contentView.addSubview(nameLabel)
		self.contentView.addSubview(priceLabel)
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setConfigView(with product: Product) {
		nameLabel.text = product.title
		priceLabel.text = String(product.price ?? 0)
		
		guard let imageURL = product.image else { return }
		guard let url = URL(string: imageURL) else { return }
		URLSession.shared.dataTask(with: url) {[weak self] (data,_,_) in
			if let data {
				DispatchQueue.main.async {
					self?.imageProductView.image = UIImage(data: data)
				}
			}
		}.resume()
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			cardBorderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			cardBorderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
			cardBorderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
			cardBorderView.heightAnchor.constraint(equalToConstant: 180),
			
			imageProductView.topAnchor.constraint(equalTo: cardBorderView.topAnchor),
			imageProductView.leadingAnchor.constraint(equalTo: cardBorderView.leadingAnchor),
			imageProductView.trailingAnchor.constraint(equalTo: cardBorderView.trailingAnchor),
			imageProductView.heightAnchor.constraint(equalTo: cardBorderView.heightAnchor),
	
			nameLabel.topAnchor.constraint(equalTo: imageProductView.bottomAnchor, constant: 5),
			nameLabel.leadingAnchor.constraint(equalTo: imageProductView.leadingAnchor, constant: 5),
			nameLabel.trailingAnchor.constraint(equalTo: imageProductView.trailingAnchor, constant: -5),
			
			priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
			priceLabel.leadingAnchor.constraint(equalTo: imageProductView.leadingAnchor, constant: 5),
			priceLabel.trailingAnchor.constraint(equalTo: imageProductView.trailingAnchor, constant: -5),
			
		])
	}
}
