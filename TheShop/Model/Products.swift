import UIKit


typealias Products = [Product]

struct Product: Codable {
	var id: Int?
	var title: String?
	var price: Double?
	var description, category: String?
	var image: String?
	var rating: Rating?
}

struct Rating: Codable {
	var rate: Double?
	var count: Int?
}
