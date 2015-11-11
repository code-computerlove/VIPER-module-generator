require('chai').should();
var generator = require('../src/generator');

describe("When getting repo name from project name", function(){
	it('Then the repo name should be the project name with hash rather than spaces and lowercase', function(){
		var expectedRepoName = "code-creator";
		var givenProjectName = "Code Creator";
		var stringParser = new StringParser();
		var repoName = stringParser.hyphenateAndLowerCase(givenProjectName);

		repoName.should.equal(expectedRepoName);


	});
});
