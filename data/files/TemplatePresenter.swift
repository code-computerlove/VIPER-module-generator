import Foundation


class TemplatePresenter {
	
	private weak var view: TemplateViewProtocol?
	private let interactor: TemplateInteractorInputProtocol
	private let wireframe: TemplateWireframeProtocol
	
	required init(view: TemplateViewProtocol, 
		interactor: TemplateInteractorInputProtocol, 
		wireframe: TemplateWireframeProtocol) {
		
			self.view = view
			self.interactor = interactor
			self.wireframe = wireframe
	}	
}


extension TemplatePresenter: TemplatePresenterProtocol {
	
	func prepareView() {
		self.view?.setTitleText("Hello World")
	}
}

extension TemplatePresenter: TemplateInteractorOutputProtocol {
	

}