return require("telescope").register_extension({
	setup = function(ext_config, config) end,

	exports = {
		mr = require("mr-telescope").mr,
	},
})
