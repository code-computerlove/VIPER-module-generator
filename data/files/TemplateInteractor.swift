import Foundation

class TemplateInteractor: TemplateInteractorInputProtocol {
	
	weak var presenter: TemplateInteractorOutputProtocol?
	private let dataManager: TemplateDataManagerProtocol
	
	
	// TemplateInteractorInputProtocol Functions
	
	required init(dataManager: TemplateDataManagerProtocol) {
		self.dataManager = dataManager
	}
}