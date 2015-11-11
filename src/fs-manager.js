var FSManager = function(fs, templateDirectoryPath) {

	this.fs = fs;
	this.templateDirectoryPath = templateDirectoryPath;
	var FILE_ENCODING = 'utf8';
	var TOKEN_TO_REPLACE = /Template/;

	this.generateDirectoryStructure = function(jsonDirectoryGraph, rootDirectoryName) {

		fs.mkdirSync(rootDirectoryName);
		generateDirectoryStructureRecursive(jsonDirectoryGraph, rootDirectoryName);
	}

	this.replaceStringInTemplateFiles = function(files, replacementString, callback) {

		var numberOfFilesToProcess = files.length;

		for (var i = 0; i < files.length; i++) {
			this.replaceStringInTemplateFile(files[i], TOKEN_TO_REPLACE, replacementString, function() {
				numberOfFilesToProcess--;
				if (numberOfFilesToProcess <= 0) { callback(); }
			});
		}
	}

	this.replaceStringInTemplateFile = function(file, stringToReplace, replacementString, callback) {

		var templateData = fs.readFileSync(templateDirectoryPath + file.name, FILE_ENCODING);

		var newFileData = templateData.split(stringToReplace).join(replacementString);
		var newFileName = file.name.replace(stringToReplace, replacementString);
		var newFilePath = replacementString +  '/' + file.path + '/' + newFileName;

		fs.writeFile(newFilePath, newFileData, FILE_ENCODING, function() {
			callback();		
		});
	}

	return this;
}

function generateDirectoryStructureRecursive(jsonDirectoryGraph, parentDirectoryName) {

	parentDirectoryName = !!parentDirectoryName ? parentDirectoryName + '/' : '';

	for (var directory in jsonDirectoryGraph) {

		var subDirectories = jsonDirectoryGraph[directory];
		var fullDirectoryName = parentDirectoryName + directory;	

		fs.mkdirSync(fullDirectoryName);
		generateDirectoryStructureRecursive(subDirectories, fullDirectoryName);
	}
}

module.exports = FSManager;