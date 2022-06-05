vim.g.tokyonight_style = "night"

vim.cmd [[
autocmd ColorScheme * highlight Whitespace ctermfg=grey guifg=grey50
match Whitespace / /

try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
