import Foundation
import UIKit


class TemplateWireframe : TemplateWireframeProtocol {

	private let mainWireframe: MainWireframe
	
	required init(mainWireframe: MainWireframe) {
		self.mainWireframe = mainWireframe
	}
	
	func presentSelfWithViewModel(viewModel: TemplateViewModel) {
		
		let module = self.createModule()
		module.presenter.viewModel = viewModel
		mainWireframe.router.navigateToViewController(module.view as! UIViewController)
	}
	
	private func createModule() -> (presenter: TemplatePresenterProtocol, view: TemplateViewProtocol) {
		
		let storyboard = UIStoryboard(name: "Template", bundle: nil)
		let viewController : TemplateViewProtocol = storyboard.instantiateInitialViewController() as! TemplateViewProtocol
		let appContentDataStore: DataStoreReaderProtocol = JsonFileDataStore(path: mainWireframe.config.appContentFilePath)
		let dataManager: TemplateDataManagerProtocol = TemplateDataManager(appContentDataStore: appContentDataStore)
		let interactor: TemplateInteractorInputProtocol = TemplateInteractor(dataManager: dataManager)
		let presenter: protocol<TemplatePresenterProtocol, TemplateInteractorOutputProtocol> = TemplatePresenter(view: viewController, interactor: interactor, wireframe: self)
		
		viewController.eventHandler = presenter
		interactor.presenter = presenter
		
		return (presenter, viewController)
	}
}