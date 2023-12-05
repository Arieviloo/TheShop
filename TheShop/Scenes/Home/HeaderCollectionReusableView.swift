import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
	
	static let identifier: String = "HeaderCollectionReusableView"
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
//		$0.text = String(localizedKey: "titleHome")
		$0.font = UIFont(name: "Bungee-Regular", size: 40)
		return $0
	}(UILabel())
	
	lazy var lineView: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.borderWidth = 2
		$0.layer.borderColor = UIColor.green.cgColor
		return $0
	}(UIView())
	
	public func titleHeader(_ title: String) {
		titleLabel.text = String(localizedKey: "\(title)")
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func commonInit() {
		addSubview(titleLabel)
		addSubview(lineView)
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
		])
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		lineView.frame = CGRect(origin: titleLabel.anchorPoint, size: CGSize(width: 100, height: 2))
	}
}
