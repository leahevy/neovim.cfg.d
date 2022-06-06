local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { 'remark_ls', 'solc', 'sorbet', 'sqlls', 'tsserver', 'ansiblels', 'graphql', 'cmake', 'bashls', 'dockerls', 'elixirls', 'kotlin_language_server', 'sumneko_lua', 'purescriptls', 'rust_analyzer', 'texlab', 'vimls', 'html', 'angularls', 'jsonls', 'pyright', 'ccls', 'cssls', 'opencl_ls', 'puppet', 'quick_lint_js', 'csharp_ls', 'gopls' }

lsp_installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("leahevy.50-lsp.handlers").on_attach,
		capabilities = require("leahevy.50-lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "leahevy.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
