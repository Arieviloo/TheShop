import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
	
	static let identifier: String = "HeaderCollectionReusableView"
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = String(localizedKey: "titleHome")
		$0.font = UIFont(name: "Bungee-Regular", size: 40)
		return $0
	}(UILabel())
	
	public func configure() {
		addSubview(titleLabel)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		titleLabel.frame = bounds
	}
	
}
