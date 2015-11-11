import Foundation
import UIKit


class TemplateViewController: UIViewController, TemplateViewProtocol {
	
	var eventHandler: TemplatePresenterProtocol!
	
	@IBOutlet weak var titleLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.eventHandler.prepareView()
	}
	
	
	//TemplateViewProtocol Functions
	
	func setTitle(title: String?) {
		self.titleLabel.text = title
	}
}