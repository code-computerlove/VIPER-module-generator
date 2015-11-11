import Foundation


class TemplatePresenter: TemplatePresenterProtocol, TemplateInteractorOutputProtocol {
	
	private weak var view: TemplateViewProtocol?
	private let interactor: TemplateInteractorInputProtocol
	private let wireframe: TemplateWireframeProtocol
	
	var viewModel: TemplateViewModel?
	
	
	//TemplatePresenterProtocol Functions
	
	required init(view: TemplateViewProtocol, interactor: TemplateInteractorInputProtocol, wireframe: TemplateWireframeProtocol) {
		
		self.userInterface = view
		self.interactor = interactor
		self.wireframe = wireframe
	}
	
	func prepareView() {
		self.view?.setTitle(viewModel?.title)
	}
}