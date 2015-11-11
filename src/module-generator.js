var fs = require('fs');

var ModuleGenerator = function(dataDirectory) {

	var dataDirectoryPath = __dirname + '/../' + dataDirectory + '/files/';
	var directoryStructure = require('../' + dataDirectory + '/directory-structure.json');
	var files = require('../' + dataDirectory + '/files.json');
	var fsManager = require('./fs-manager')(fs, dataDirectoryPath);

	this.generateModule = function(moduleName, callback) {

		fsManager.generateDirectoryStructure(directoryStructure, moduleName);
		fsManager.replaceStringInTemplateFiles(files, moduleName, callback);
	}

	return this;
}

module.exports = ModuleGenerator;