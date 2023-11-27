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
		$0.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
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
		])
	}
}
