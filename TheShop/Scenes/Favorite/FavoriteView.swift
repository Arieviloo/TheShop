import UIKit

class FavoriteView: UIView {
	
	lazy var productCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
		layout.scrollDirection = .vertical
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .none
		$0.setCollectionViewLayout(layout, animated: true)
		$0.backgroundColor = .green
		
		return $0
	}(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupSubView()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupSubView() {
		addSubview(productCollectionView)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			productCollectionView.topAnchor.constraint(equalTo: topAnchor),
			productCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			productCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			productCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
}

