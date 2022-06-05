vim.cmd [[
augroup _fmt
  autocmd!
  autocmd BufWritePre * if exists(":Neoformat") | execute 'undojoin' | execute 'Neoformat' | endif
augroup END
]]
