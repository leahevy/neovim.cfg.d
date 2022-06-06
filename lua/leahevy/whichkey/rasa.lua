vim.cmd('autocmd BufNewFile,BufRead * lua WhichKeyRasa()')
function WhichKeyRasa()
    if file_exists("data/nlu.yml") then
        which_key.register({
            I = {
              name = "Rasa",
              k = { "<cmd>!bash -c 'pkill rasa'<cr>", "Kill rasa" },
              a = { "<cmd>!bash -c 'rasa run actions'&<cr>", "Run action server" },
              s = { "<cmd>!bash -c 'rasa shell'<cr>", "Open rasa shell" },
              t = { "<cmd>!bash -c 'rasa train'<cr>", "Run rasa train" },
              r = { "<cmd>!bash -c 'rasa run'&<cr>", "Run rasa server" },
            },
        }, whichkey_opts)
    end
end

