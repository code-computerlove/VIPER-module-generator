import Foundation


class TemplatePresenter: TemplatePresenterProtocol, TemplateInteractorOutputProtocol {
	
	private weak var view: TemplateViewProtocol?
	private let interactor: TemplateInteractorInputProtocol
	private let wireframe: TemplateWireframeProtocol
	
	
	//TemplatePresenterProtocol Functions
	
	required init(view: TemplateViewProtocol, interactor: TemplateInteractorInputProtocol, wireframe: TemplateWireframeProtocol) {
		
		self.userInterface = view
		self.interactor = interactor
		self.wireframe = wireframe
	}
	
	func prepareView() {
		self.view?.setTitle("Hello World")
	}
}