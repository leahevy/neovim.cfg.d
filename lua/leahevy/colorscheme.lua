vim.cmd [[
autocmd ColorScheme * highlight Whitespace ctermfg=grey guifg=grey50
match Whitespace / /

try
  colorscheme ghdark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
