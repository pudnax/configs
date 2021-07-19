local M = {}

M.config = function()
	O.plugin.neogit = {
		disable_signs = false,
		disable_context_highlighting = false,
		disable_commit_confirmation = false,
		-- customize displayed signs
		signs = {
			-- { CLOSED, OPENED }
			section = { ">", "v" },
			item = { ">", "v" },
			hunk = { "", "" },
		},
		integrations = {
			-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
			-- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
			--
			-- Requires you to have `sindrets/diffview.nvim` installed.
			-- use {
			--   'TimUntersberger/neogit',
			--   requires = {
			--     'nvim-lua/plenary.nvim',
			--     'sindrets/diffview.nvim'
			--   }
			-- }
			--
			diffview = true,
		},
		-- override/add mappings
		mappings = {
			-- modify status buffer mappings
			status = {
				-- Adds a mapping with "B" as key that does the "BranchPopup" command
				["B"] = "BranchPopup",
				-- Removes the default mapping of "s"
				-- ["s"] = "",
			},
		},
	}
end

M.setup = function()
	local status_ok, neogit = pcall(require, "neogit")
	if not status_ok then
		return
	end
	neogit.setup(O.plugin.neogit)
end

return M
