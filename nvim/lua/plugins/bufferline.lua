-- Visualize tabs
return {
   "akinsho/bufferline.nvim",
   dependencies = "nvim-tree/nvim-web-devicons",
   lazy = false,
   keys = {
      {'<leader>n', ':bn<cr>'},
      {'<leader>p', ':bp<cr>'},
      {'<leader>x', ':bd<cr>'},
   },
   config = function()
      require('bufferline').setup {}
      -- local set = vim.keymap.set
      -- -- buffer
      -- set('n', '<leader>n', ':bn<cr>')
      -- set('n', '<leader>p', ':bp<cr>')
      -- set('n', '<leader>x', ':bd<cr>')
   end
}
