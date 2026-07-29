 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#072036',
    base01 = '#0f3657',
    base02 = '#0b3150',
    base03 = '#5f6b74',
    base04 = '#afb3b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#c4715a',
    base09 = '#9751e8',
    base0A = '#5157e8',
    base0B = '#61abea',
    base0C = '#bc8ef0',
    base0D = '#8ec3f0',
    base0E = '#8e92f0',
    base0F = '#572314',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#072036' })
  hi('TelescopeBorder',         { fg = '#5f6b74',             bg = '#072036' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#072036' })
  hi('TelescopePromptBorder',   { fg = '#5f6b74',             bg = '#072036' })
  hi('TelescopePromptPrefix',   { fg = '#61abea',             bg = '#072036' })
  hi('TelescopePromptCounter',  { fg = '#afb3b6',  bg = '#072036' })
  hi('TelescopePromptTitle',    { fg = '#072036',             bg = '#61abea' })
  hi('TelescopePreviewTitle',   { fg = '#072036',             bg = '#5157e8' })
  hi('TelescopeResultsTitle',   { fg = '#072036',             bg = '#9751e8' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#0b3150' })
  hi('TelescopeSelectionCaret', { fg = '#61abea',             bg = '#0b3150' })
  hi('TelescopeMatching',       { fg = '#61abea',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
