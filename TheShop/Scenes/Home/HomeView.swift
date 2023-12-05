import UIKit

class HomeView: UIView {
	
	
	lazy var productCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
		layout.scrollDirection = .vertical
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .none
		$0.setCollectionViewLayout(layout, animated: true)
		$0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
		$0.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
		
		return $0
	}(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configAddView()
		configConstraints()
		backgroundColor = UIColor.appBackgroundColor
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configDelegateCollection(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
		self.productCollectionView.delegate = delegate
		self.productCollectionView.dataSource = dataSource
	}
	
	private func configAddView() {
		addSubview(productCollectionView)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			
			productCollectionView.topAnchor.constraint(equalTo: topAnchor),
			productCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			productCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			productCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
