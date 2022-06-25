-- Reloads neovim config whenever you save any config file
function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^leahevy') then
      package.loaded[name] = nil
    end
  end

  vim.cmd "unmap <Space>"
  vim.cmd "source $MYVIMRC"
  vim.cmd "PackerSync"
end