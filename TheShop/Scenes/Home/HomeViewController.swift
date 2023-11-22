import UIKit

class HomeViewController: UIViewController {
	
	private var homeView: HomeView?
	
	override func loadView() {
		homeView = HomeView()
		view = homeView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

}

