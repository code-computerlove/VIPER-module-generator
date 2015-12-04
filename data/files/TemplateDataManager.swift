import Foundation


class TemplateDataManager {

	private let appContentDataStore: DataStoreReaderProtocol
	
	required init(appContentDataStore: DataStoreReaderProtocol) {
		self.appContentDataStore = appContentDataStore
	}
}


extension TemplateDataManager: TemplateDataManagerProtocol {
	
}