-- Reloads neovim config whenever you save any config file
function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^leahevy') then
      package.loaded[name] = nil
    end
  end

  vim.cmd "source $MYVIMRC"
end

vim.cmd [[
  augroup user_config
    autocmd!
    autocmd BufWritePost *-*.lua lua ReloadConfig()
  augroup end
]]