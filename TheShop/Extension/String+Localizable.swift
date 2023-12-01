import UIKit

extension String {
	init(localizedKey: String) {
		let initText = NSLocalizedString(localizedKey, comment: "")
		self.init(initText)
	}
	
	func currencyFormatting() -> String {
		if let value = Double(self) {
			let formatter = NumberFormatter()
			formatter.numberStyle = .currency
			formatter.maximumFractionDigits = 2
			formatter.minimumFractionDigits = 2
			if let str = formatter.string(for: value) {
				return str
			}
		}
		return ""
	}
}
