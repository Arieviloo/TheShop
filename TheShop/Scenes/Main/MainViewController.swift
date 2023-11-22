import UIKit

class MainViewController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabBar()
	}
	
	private func setupTabBar() {
		let homeVC = HomeViewController()
		let favVC = FavoriteViewController()
		
		let homeNC = UINavigationController(rootViewController: homeVC)
		let favNC = UINavigationController(rootViewController: favVC)
		
		homeNC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), tag: 1)
		favNC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart.fill"), tag: 2)
		
		let tabBarList = [homeNC, favNC]
		
		setViewControllers(tabBarList, animated: true)
	}
}
