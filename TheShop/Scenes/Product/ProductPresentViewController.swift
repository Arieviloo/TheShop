import UIKit

class ProductPresentViewController: UIViewController {
	
	private var productView = ProductPresentView()
	
	override func viewDidLoad() {
		view = productView
		super.viewDidLoad()
		productView.delegate(delegate: self)
	}
}

extension ProductPresentViewController: ProductPresentViewProtocol {
	func tappedBackButton() {
		dismiss(animated: true)
	}
	
}
