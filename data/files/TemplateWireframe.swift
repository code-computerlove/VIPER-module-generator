import Foundation
import UIKit


class TemplateWireframe : TemplateWireframeProtocol {

	private let mainWireframe: MainWireframe
	
	required init(mainWireframe: MainWireframe) {
		self.mainWireframe = mainWireframe
	}
	
	func createModule() -> (presenter: TemplatePresenterProtocol, view: TemplateViewProtocol) {
		
		let storyboard = UIStoryboard(name: "Template", bundle: nil)
		let viewController = storyboard.instantiateInitialViewController() as! TemplateViewProtocol

		let interactor = TemplateInteractor(
			dataManager: TemplateDataManager(
				appContentDataStore: JsonFileDataStore(
					path: mainWireframe.config.appContentFilePath)))

		let presenter = TemplatePresenter(
			view: viewController, 
			interactor: interactor, 
			wireframe: self)
		
		viewController.eventHandler = presenter
		interactor.presenter = presenter
		
		return (presenter, viewController)
	}
}


extension TemplateWireframe: TemplateWireframeProtocol {
	
	func presentSelf() {
		let module = self.createModule()
		mainWireframe.router.navigateToViewController(module.view as! UIViewController)
	}
}