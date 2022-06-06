-- Fix gx
vim.cmd [[
    function! HandleURL()
        let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
        echo s:uri
        if s:uri != ""
            silent exec "!open '".s:uri."'"
        else
            echo "No URI found in line."
        endif
    endfunction
    noremap gx :call HandleURL()<cr>
]]
