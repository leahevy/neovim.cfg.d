-- Fix gx
if vim.fn.has("mac") == 1 then
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
        map gx :call HandleURL()<cr>
    ]]
end
