local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "leahevy.50-lsp.configs"
require("leahevy.50-lsp.handlers").setup()
require "leahevy.50-lsp.null-ls"
