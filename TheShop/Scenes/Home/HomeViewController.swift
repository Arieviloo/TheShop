import UIKit

class HomeViewController: UIViewController {
	
	private var homeView: HomeView?
	private let service = DataShop.shared
	private let productVC = ProductPresentViewController()
	private var products: Products = []
	
	override func loadView() {
		homeView = HomeView()
		view = homeView
		
		service.getProduct{[weak self] result in
			switch result {
			case .success(let sucess):
				self?.products = sucess
				self?.homeView?.productCollectionView.reloadData()
			case .failure(let error):
				print(error)
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		homeView?.configDelegateCollection(delegate: self, dataSource: self)
		navigationController?.isNavigationBarHidden = true
	}
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return products.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
		let productCell = products[indexPath.row]
		cell?.setConfigView(with: productCell)
		return cell ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let widthFrame = CGFloat((self.view.frame.width / 2 ) - 15)
		return CGSize(width: widthFrame , height: 300)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		productVC.setProductView(products[indexPath.row])
		productVC.modalPresentationStyle = .fullScreen
		present(productVC, animated: true)
	}
	
	//Header Collection
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard let header = collectionView.dequeueReusableSupplementaryView(
			ofKind: UICollectionView.elementKindSectionHeader,
			withReuseIdentifier: HeaderCollectionReusableView.identifier,
			for: indexPath) as? HeaderCollectionReusableView else {
			return UICollectionReusableView()
		}
		header.viewWithTag(2)
		header.configure()
		
		return header
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.size.width, height: 100)
	}
}
