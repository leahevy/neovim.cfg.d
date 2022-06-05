local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "leahevy.lsp.configs"
require("leahevy.lsp.handlers").setup()
require "leahevy.lsp.null-ls"
