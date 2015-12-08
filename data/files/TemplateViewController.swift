import Foundation
import UIKit


class TemplateViewController: UIViewController {
	
	var eventHandler: TemplatePresenterProtocol!
	
	@IBOutlet weak var titleLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.eventHandler.prepareView()
	}
}


extension TemplateViewController: TemplateViewProtocol {

	func setTitleText(title: String?) {
		self.titleLabel.text = title
	}
}