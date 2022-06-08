vim.cmd [[
    let g:minimap_width = 10
    let g:minimap_auto_start = 0
    let g:minimap_auto_start_win_enter = 0
    let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'fzf', 'nvimtree']
    let g:minimap_close_filetypes = ['startify', 'netrw', 'vim-plug', 'alpha']
	let g:minimap_git_colors = 1

    function _minimap()
        if &filetype != "alpha"
            execute "Minimap"
        endif
    endfunction
    autocmd BufNewFile,BufRead * call _minimap()
]]
