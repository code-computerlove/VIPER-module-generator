import Foundation


class TemplateInteractor {
	
	weak var presenter: TemplateInteractorOutputProtocol?
	private let dataManager: TemplateDataManagerProtocol
	
	required init(dataManager: TemplateDataManagerProtocol) {
		self.dataManager = dataManager
	}
}


extension TemplateInteractor: TemplateInteractorInputProtocol {
	
}