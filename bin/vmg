#!/usr/bin/env node

var program = require('commander');
var packageJson = require('read-package-json');
var utils = require('../src/utils');

var templateDataDirName = 'data';
var generator = require('../src/module-generator')(templateDataDirName);

packageJson(__dirname + '/../package.json',function (error, package) {
	
	program.version(package.version);

	program
		.command('create [name]')
		.description('Create a new VIPER module with the specified name')
		.option("-s, --setup_mode [mode]", "Which setup mode to use")
		.action(createModule);

	program.parse(process.argv);

	if (!process.argv.slice(2).length) {
		program.outputHelp(utils.make_red);
	}
});

function createModule(name, options) {

	generator.generateModule(name, function() {
		console.log(name + 'Module successfully created')
	});
}