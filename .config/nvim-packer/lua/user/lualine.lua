local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch },
		lualine_c = {
			"filename",
			"fileformat",
			"lsp_progress",
		},
		lualine_x = {
			diagnostics,
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "fugitive", "nvim-tree", "quickfix" },
})
