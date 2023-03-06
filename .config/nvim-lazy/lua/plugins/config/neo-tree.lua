local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
	vim.notify("Neotree not found")
	return
end
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neo_tree.setup({
	close_if_last_window = true,
	enable_diagnostics = true,
	enable_git_status = true,
	window = {
		width = 25,
		mappings = {
			["l"] = "open",
			["h"] = "close_node",
			["v"] = "open_split",
		},
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
})
