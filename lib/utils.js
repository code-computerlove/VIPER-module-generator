var colors = require('colors');

var Utils = function() {

	this.make_red = function(txt) {
		return colors.red(txt);
	}
}

module.exports = new Utils();