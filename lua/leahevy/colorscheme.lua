vim.cmd [[
autocmd ColorScheme * highlight Whitespace ctermfg=grey guifg=grey50
autocmd ColorScheme * highlight EOL ctermfg=grey guifg=grey50
match Whitespace / /
match EOL /\n/

try
  colorscheme ghdark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
