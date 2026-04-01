vim.g.mapleader = " "
local opt = vim.opt

--- ==================================================
--- OPTIONS
--- ==================================================
-- Line options
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.backspace = "indent,eol,start"
opt.signcolumn = "yes"
opt.colorcolumn = "100"

-- Fold config
opt.showmatch = true
opt.foldcolumn = "1"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99

-- Backup config
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.updatetime = 300
opt.autoread = true
opt.hidden = true

-- Tab config
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true

-- Number related configs
opt.encoding = "utf-8" -- set encoding
opt.number = true
opt.relativenumber = true

-- Whitespace config
opt.list = true
opt.listchars = {
	tab = ">> ",
	trail = " ",
	nbsp = "+",
}

-- Search config
opt.ignorecase = true
opt.smartcase = true

-- Diagnostic
opt.winborder = "rounded"
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
	},
})
opt.termguicolors = true

-- Cursor config
vim.api.nvim_set_hl(0, "CursorM", { fg = "#000000", bg = "#d20efc" })
opt.guicursor = "n-v-c:block-CursorM,i-ci:ver40-CursorM,a:blinkwait700-blinkoff400-blinkon250-CursorM"

--- ==================================================
--- Keymaps
--- ==================================================
local function set(mode, keys, command, desc)
	Set(mode, keys, command, { desc = desc })
end

-- Basic configs
Set({ "n", "v" }, "<leader>y", [["+y]])
Set("n", "<esc>", ":nohlsearch<CR>", { silent = true, desc = "Clear highlighted search text" })

-- Go to config dir
set("n", "<leader>cfg", ":cd ~/.config/nvim/<cr> :e .<cr>", "Go to config dir")

-- Better movement
set({ "n", "v" }, "<leader>l", "$", "Go to the end of the line")
set({ "n", "v" }, "<leader>h", "_", "Go to the begin of the line")

vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

set("n", "n", "nzzzv", "Next search result (centered)")
set("n", "N", "Nzzzv", "Previous search result (centered)")
set("n", "<leader>j", "<C-d>zz", "Half page down (centered)")
set("n", "<leader>k", "<C-u>zz", "Half page up (centered)")

-- Splitting and resizing
set("n", "<leader>sv", ":vsplit<cr>", "Split window vertically")
set("n", "<leader>sh", ":split<cr>", "Split window horizontally")
set("n", "<C-Up>", ":resize +2<cr>", "Increase window height")
set("n", "<C-Down>", ":resize -2<cr>", "Decrease window height")
set("n", "<C-Left>", ":vertical resize -2<cr>", "Decrease window width")
set("n", "<C-Right>", ":vertical resize +2<cr>", "Increase window width")

-- Window navigation
set("n", "<C-h>", "<C-w>h", "Move to left window")
set("n", "<C-j>", "<C-w>j", "Move to bottom window")
set("n", "<C-k>", "<C-w>k", "Move to top window")
set("n", "<C-l>", "<C-w>l", "Move to right window")

-- Move lines up/down
set("n", "<A-J>", ":m .+1<cr>==", "Move line down")
set("n", "<A-K>", ":m .-2<cr>==", "Move line up")
set("v", "<A-J>", ":m '>+1<cr>gv=gv", "Move selection down")
set("v", "<A-K>", ":m '<-2<cr>gv=gv", "Move selection up")

-- Better indenting in visual mode
set("v", "<", "<gv", "Indent left and reselect")
set("v", ">", ">gv", "Indent right and reselect")

--- ==================================================
--- AUTOCMDS
--- ==================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
function CreateAutocmd(event, opts)
	vim.api.nvim_create_autocmd(event, opts)
end

-- highlight yanked text
CreateAutocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- return to last cursor position
CreateAutocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

-- Open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- auto resize splits
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
