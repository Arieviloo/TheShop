import UIKit

class HomeViewController: UIViewController {
	
	private var homeView: HomeView?
	private let service = DataShop.shared
	
	let textqul = ["ja", "di", "swift", "kotlin", "ja", "di", "swift"]
	override func loadView() {
		homeView = HomeView()
		view = homeView
		
//		service.getProduct{[weak self] result in
//			print("deu bom")
//		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		homeView?.configDelegateCollection(delegate: self, dataSource: self)
	}

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return textqul.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
		print(textqul[indexPath.row])
		cell?.nameLabel.text = textqul[indexPath.row]
		return cell ?? UICollectionViewCell()
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let widthFrame = CGFloat((self.view.frame.width / 2 ) - 15)
		return CGSize(width: widthFrame , height: 150)
	}
	
}
