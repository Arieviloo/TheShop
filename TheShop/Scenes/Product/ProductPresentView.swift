import UIKit

protocol ProductPresentViewProtocol: AnyObject {
	func tappedBackButton()
}

class ProductPresentView: UIView {
	
	private weak var delegate: ProductPresentViewProtocol?
	func delegate(delegate: ProductPresentViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var contentView: UIView = {
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
	
	lazy var backButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.setImage(UIImage(systemName: "arrowshape.backward"), for: .normal)
		$0.tintColor = UIColor.black
		$0.backgroundColor = .green
		$0.layer.borderWidth = 2
		$0.layer.cornerRadius = 8
		$0.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	lazy var nameProductLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = "text"
		$0.numberOfLines = 0
		return $0
	}(UILabel())
	
	lazy var priceProductLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = "R$ 0,00"
		$0.numberOfLines = 0
		return $0
	}(UILabel())
	
	lazy var addToCartButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .green
		$0.setTitle("Add to cart", for: .normal)
		return $0
	}(UIButton(type: .system))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.appBackgroundColor
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		addSubview(contentView)
		contentView.addSubview(backButton)
		addSubview(nameProductLabel)
		addSubview(priceProductLabel)
		addSubview(addToCartButton)
	}
	
	@objc func tappedBackButton() {
		delegate?.tappedBackButton()
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
			contentView.heightAnchor.constraint(equalToConstant: 400),
			
			backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
			backButton.widthAnchor.constraint(equalToConstant: 40),
			backButton.heightAnchor.constraint(equalToConstant: 40),
			
			nameProductLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
			nameProductLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			nameProductLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			
			priceProductLabel.topAnchor.constraint(equalTo: nameProductLabel.bottomAnchor, constant: 10),
			priceProductLabel.leadingAnchor.constraint(equalTo: nameProductLabel.leadingAnchor),
			priceProductLabel.trailingAnchor.constraint(equalTo: nameProductLabel.trailingAnchor),
			
			addToCartButton.topAnchor.constraint(equalTo: priceProductLabel.bottomAnchor, constant: 20),
			addToCartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			addToCartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
	}
}
