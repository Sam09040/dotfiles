vim.g.mapleader = " "
local opt = vim.opt

opt.cursorline = true
opt.backspace = "indent,eol,start"

-- Fold config
opt.foldcolumn = "1"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99

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

-- Keymaps
local function set(mode, keys, command, desc)
  Set(mode, keys, command, { desc = desc })
end

-- Go to config dir
set("n", "<leader>cfg", ":cd ~/.config/nvim/<cr> :e .<cr>", "Go to config dir")

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
