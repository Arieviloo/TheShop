import UIKit

class HomeView: UIView {
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.text = String(localizedKey: "titleHome")
		$0.font = UIFont(name: "Bungee-Regular", size: 40)
		return $0
	}(UILabel())
	
	lazy var lineView: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.borderWidth = 2
		$0.layer.borderColor = UIColor.green.cgColor
		return $0
	}(UIView())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configAddView()
		configConstraints()
		
		backgroundColor = UIColor.appBackgroundColor
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configAddView() {
		addSubview(titleLabel)
		addSubview(lineView)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
			titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
			titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
			
			lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
			lineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			lineView.widthAnchor.constraint(equalToConstant: 120),
			lineView.heightAnchor.constraint(equalToConstant: 2)
		])
	}
}
