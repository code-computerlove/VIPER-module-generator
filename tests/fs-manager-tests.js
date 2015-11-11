require('chai').should();


var createdDirectories = [];

var fakeFs = {
	mkdirSync: function(name) { 
		createdDirectories.push(name);
	},
	readFileSync: function(file, encoding) {
		return "Test Data"
	},
	writeFile: function(path, data, encoding, callback) {
		callback();
	}
}

describe("When creating a directory structure", function(){
	it('Then the created structure should match the desired structure', function(){
		
		var subjectUnderTest = require('../src/fs-manager')(fakeFs, '');

		var rootDirectory = "Folder0";

		var directoryStructure = {
			"Folder1": {
				"Folder2": {},
				"Folder3": {}
			}
		};

		subjectUnderTest.generateDirectoryStructure(directoryStructure, rootDirectory);
		createdDirectories.length.should.eq(4);
		createdDirectories[0].should.eq('Folder0');
		createdDirectories[1].should.eq('Folder0/Folder1');
		createdDirectories[2].should.eq('Folder0/Folder1/Folder2');
		createdDirectories[3].should.eq('Folder0/Folder1/Folder3');
	});
});

describe("When replacing the token in files", function(){
	it("Then the file data should not contain the token", function(done) {

		var testData = "Template Module";
		var subjectUnderTest = require('../src/fs-manager')(fakeFs, '');
		var file = { name: "TestFile", path: "." };


		subjectUnderTest.replaceStringInTemplateFile(file, "Template", "Replaced", function() {
			done();
		});
	});
});
