local mypy_cmd = "mypy --pretty " ..
                "--warn-unused-configs " ..
                "--disallow-any-generics " ..
                "--disallow-subclassing-any " ..
                "--disallow-untyped-calls " ..
                "--disallow-untyped-defs " ..
                "--disallow-incomplete-defs " ..
                "--check-untyped-defs " ..
                "--disallow-untyped-decorators " ..
                "--no-implicit-optional " ..
                "--warn-redundant-casts " ..
                "--warn-return-any " ..
                "--no-implicit-reexport " ..
                "--strict-equality"

local flake8_cmd = "flake8 --show-source --max-complexity=13 --max-line-length=79"

vim.cmd [[
augroup _whichkey_python
  autocmd FileType python lua WhichKeyPython()
augroup end
]]

function WhichKeyPython()
    which_key.register({
        m = {
          name = "Python",
          t = { "<cmd>!bash -c '(cd tests 2>/dev/null; pytest)'<cr>", "Run pytest" },
          m = { "<cmd>!bash -c '" .. mypy_cmd .. " .'<cr>", "Run mypy globally" },
          M = { "<cmd>!bash -c '" .. mypy_cmd .. " " .. vim.fn.expand('%') .. "'<cr>", "Run mypy on file" },
          f = { "<cmd>!bash -c '" .. flake8_cmd .. " .'<cr>", "Run flake8 globally" },
          F = { "<cmd>!bash -c '" .. flake8_cmd .. " " .. vim.fn.expand('%') .. "'<cr>", "Run flake8 on file" },
        },
    }, whichkey_opts)
end
