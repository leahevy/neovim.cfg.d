vim.cmd [[
augroup _colorscheme
    autocmd ColorScheme * highlight Whitespace ctermfg=grey guifg=grey30
    autocmd ColorScheme * highlight EOL ctermfg=grey guifg=grey30
augroup end
match Whitespace / /
match EOL /\n/

try
  colorscheme mytheme
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]