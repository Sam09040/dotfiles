vim.g.mapleader = ' '
local opt = vim.opt

-- Tab config
opt.expandtab= true 
opt.tabstop = 3
opt.softtabstop = 3
opt.shiftwidth = 3
opt.autoindent = true

-- Number related configs
opt.encoding = "utf-8" -- set encoding
opt.number = true
opt.relativenumber = true

-- Whitespace config
opt.list = true
opt.listchars = {
   tab = '>> ',
   trail = '>',
   nbsp = '+',
}

-- Search config
opt.ignorecase = true
opt.smartcase = true

-- Diagnostic
vim.diagnostic.config({
   virtual_text = true,
   signs = true,
   underline = true,
   update_in_insert = true,
})
