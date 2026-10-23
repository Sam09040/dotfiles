 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#070a36',
    base01 = '#0f1357',
    base02 = '#0b0f50',
    base03 = '#5d5f6d',
    base04 = '#afafb6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#de4be7',
    base0A = '#954be7',
    base0B = '#6269ea',
    base0C = '#ea8ff0',
    base0D = '#8f94f0',
    base0E = '#bd8ff0',
    base0F = '#d7bbf6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#070a36' })
  hi('TelescopeBorder',         { fg = '#5d5f6d',             bg = '#070a36' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#070a36' })
  hi('TelescopePromptBorder',   { fg = '#5d5f6d',             bg = '#070a36' })
  hi('TelescopePromptPrefix',   { fg = '#6269ea',             bg = '#070a36' })
  hi('TelescopePromptCounter',  { fg = '#afafb6',  bg = '#070a36' })
  hi('TelescopePromptTitle',    { fg = '#070a36',             bg = '#6269ea' })
  hi('TelescopePreviewTitle',   { fg = '#070a36',             bg = '#954be7' })
  hi('TelescopeResultsTitle',   { fg = '#070a36',             bg = '#de4be7' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#0b0f50' })
  hi('TelescopeSelectionCaret', { fg = '#6269ea',             bg = '#0b0f50' })
  hi('TelescopeMatching',       { fg = '#6269ea',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f2f3',          bg = '#070a36' })
  hi('MiniPickBorder',         { fg = '#5d5f6d',             bg = '#070a36' })
  hi('MiniPickPrompt',   { fg = '#f2f2f3',          bg = '#070a36' })
  hi('MiniPickPromptPrefix',   { fg = '#6269ea',             bg = '#070a36' })
  hi('MiniPickBorderText',    { fg = '#070a36',             bg = '#6269ea' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f2f3',          bg = '#0b0f50' })
  hi('MiniPickPromptCaret', { fg = '#6269ea',             bg = '#0b0f50' })
  hi('MiniPickMatchRanges',       { fg = '#6269ea',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
