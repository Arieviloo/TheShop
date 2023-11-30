import UIKit

class ProductPresentViewController: UIViewController {
	
	private var productView = ProductPresentView()
	
	override func viewDidLoad() {
		view = productView
		super.viewDidLoad()
		productView.delegate(delegate: self)
	}
	
	public func setProductView(_ product: Product) {
		productView.setConfigView(product)
	}
}

extension ProductPresentViewController: ProductPresentViewProtocol {
	func tappedBackButton() {
		dismiss(animated: true)
	}
	
}
