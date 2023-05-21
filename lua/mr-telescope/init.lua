local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local function file_list(t)
	if t == "mrw" then
		return vim.fn["mr#mrw#list"]()
	elseif t == "mrr" then
		return vim.fn["mr#mrr#list"]()
	else
		return vim.fn["mr#mru#list"]()
	end
end

local mr = function(opts)
	opts = opts or {}
	local type = vim.g.mr_type

	pickers
		.new(opts, {
			prompt_title = "mr",
			finder = finders.new_table({
				results = file_list(type),
			}),
			sorter = conf.generic_sorter(opts),
		})
		:find()
end

return {
	mr = mr,
}
