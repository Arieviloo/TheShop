import UIKit

class DataShop: NSObject {
	
	static let shared = DataShop()
	
	func getProduct(completion: @escaping(Result<Products, Error>) -> Void) {
		let urlString: String = "http://localhost:3004/"
		guard let url: URL = URL(string: urlString) else { return }
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			DispatchQueue.main.async {
				if let error {
					print(error)
				}
				guard let data else { return }
				guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
				print(data)
				
				do {
					let products: Products = try JSONDecoder().decode(Products.self, from: data)
					print(products)
				} catch {
					print("error -> \(error)")
				}
			}
			
		}.resume()
	}
}

