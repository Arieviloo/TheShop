import UIKit

class FavoriteViewController: UIViewController {
	
	private var favoriteView: FavoriteView?
	public var productsFav: [Products] = []
	
	override func loadView() {
		favoriteView = FavoriteView()
		view = favoriteView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.appBackgroundColor
		
		favoriteView?.delegateCollectionView(delegate: self, dataSource: self)
	}
}

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return productsFav.count 
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
		
		return cell ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard let header = collectionView.dequeueReusableSupplementaryView(
			ofKind: UICollectionView.elementKindSectionHeader,
			withReuseIdentifier: HeaderCollectionReusableView.identifier,
			for: indexPath) as? HeaderCollectionReusableView else {
			return UICollectionReusableView()
		}
		header.titleHeader("titleFavorite")
		
		return header
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.size.width, height: 100)
	}
}
