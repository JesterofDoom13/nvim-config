 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#291b14',
    base01 = '#452d21',
    base02 = '#3e291e',
    base03 = '#73665f',
    base04 = '#b6b1af',
    base05 = '#f3f2f2',
    base06 = '#f3f2f2',
    base07 = '#f3f2f2',
    base08 = '#91503b',
    base09 = '#a9cc66',
    base0A = '#d6c35c',
    base0B = '#e49267',
    base0C = '#cce996',
    base0D = '#ecb193',
    base0E = '#e9dc96',
    base0F = '#3c1b10',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f3f2f2',          bg = '#291b14' })
  hi('TelescopeBorder',         { fg = '#73665f',             bg = '#291b14' })
  hi('TelescopePromptNormal',   { fg = '#f3f2f2',          bg = '#291b14' })
  hi('TelescopePromptBorder',   { fg = '#73665f',             bg = '#291b14' })
  hi('TelescopePromptPrefix',   { fg = '#e49267',             bg = '#291b14' })
  hi('TelescopePromptCounter',  { fg = '#b6b1af',  bg = '#291b14' })
  hi('TelescopePromptTitle',    { fg = '#291b14',             bg = '#e49267' })
  hi('TelescopePreviewTitle',   { fg = '#291b14',             bg = '#d6c35c' })
  hi('TelescopeResultsTitle',   { fg = '#291b14',             bg = '#a9cc66' })
  hi('TelescopeSelection',      { fg = '#f3f2f2',          bg = '#3e291e' })
  hi('TelescopeSelectionCaret', { fg = '#e49267',             bg = '#3e291e' })
  hi('TelescopeMatching',       { fg = '#e49267',             bold = true })
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
