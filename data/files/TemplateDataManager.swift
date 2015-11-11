import Foundation

class TemplateDataManager: TemplateDataManagerProtocol {

	private let appContentDataStore: DataStoreReaderProtocol
	
	
	// TemplateDataManagerProtocol Functions
	
	required init(appContentDataStore: DataStoreReaderProtocol) {
		self.appContentDataStore = appContentDataStore
	}
}