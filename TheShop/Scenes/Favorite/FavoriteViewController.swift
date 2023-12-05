import UIKit

class FavoriteViewController: UIViewController {
	
	private var favoriteView: FavoriteView?
	
	override func loadView() {
		favoriteView = FavoriteView()
		view = favoriteView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.appBackgroundColor
	}
}
