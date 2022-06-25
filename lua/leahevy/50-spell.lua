vim.cmd [[
  augroup _spell
    autocmd FileType markdown setlocal spell
    autocmd FileType text setlocal spell
    autocmd FileType tex setlocal spell
  augroup end
]]
