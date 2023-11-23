import UIKit

class HomeViewController: UIViewController {
	
	private var homeView: HomeView?
	private let service = DataShop.shared
	
	override func loadView() {
		homeView = HomeView()
		view = homeView
		
		service.getProduct{[weak self] result in
			print("deu bom")
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

}

