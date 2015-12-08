import Foundation
import UIKit


protocol TemplateWireframeProtocol: class {
	init(mainWireframe: MainWireframe)
	func presentSelf()
}

protocol TemplateViewProtocol: class {
	var eventHandler: TemplatePresenterProtocol! { get set }
	func setTitleText(title: String?)
}

protocol TemplatePresenterProtocol: class {
	init(view: TemplateViewProtocol, 
		interactor: TemplateInteractorInputProtocol, 
		wireframe: TemplateWireframeProtocol)
	func prepareView()
}

protocol TemplateInteractorOutputProtocol: class {
	
}

protocol TemplateInteractorInputProtocol: class {
	weak var presenter: TemplateInteractorOutputProtocol? {get set }
	init(dataManager: TemplateDataManagerProtocol)
}

protocol TemplateDataManagerProtocol: class {
	init(appContentDataStore: DataStoreReaderProtocol)
}