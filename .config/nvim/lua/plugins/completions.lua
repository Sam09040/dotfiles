return {
	{
		"saghen/blink.cmp",
		debug = true,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"xzbdmw/colorful-menu.nvim",
			"moyiz/blink-emoji.nvim",
		},
		build = "cargo build --release",
		opts = {
			fuzzy = { implementation = "prefer_rust_with_warning" },
			completion = {
				accept = { auto_brackets = { enabled = false } },
				ghost_text = {
					enabled = true,
					show_with_menu = true,
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = true,
					},
				},
				menu = {
					border = "single",
					direction_priority = function()
						local ctx = require("blink.cmp").get_context()
						local item = require("blink.cmp").get_selected_item()
						if ctx == nil or item == nil then
							return { "s", "n" }
						end

						local item_text = item.textEdit ~= nil and item.textEdit.newText
							or item.insertText
							or item.label
						local is_multi_line = item_text:find("\n") ~= nil

						if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
							vim.g.blink_cmp_upwards_ctx_id = ctx.id
							return { "n", "s" }
						end
						return { "s", "n" }
					end,
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", gap = 1 },
							components = {
								label = {
									text = function(ctx)
										return require("colorful-menu").blink_components_text(ctx)
									end,
									highlight = function(ctx)
										return require("colorful-menu").blink_components_highlight(ctx)
									end,
								},
							},
						},
					},
				},
				documentation = { window = { border = "single" }, auto_show = true },
			},
			keymap = {
				preset = "default",
				["<Esc>"] = { "hide", "fallback" },
				["<cr>"] = { "accept", "fallback" },
			},
			signature = { window = { border = "single rounded" } },
			sources = {
				default = {
					"lsp",
					"buffer",
					"snippets",
					"path",
					"emoji",
				},
				providers = {
					path = {
						opts = {
							get_cwd = function()
								return vim.fn.getcwd()
							end,
						},
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						opts = {
							insert = true,
							trigger = function()
								return { ":" }
							end,
						},
					},
				},
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		priority = 50,
	},
}
