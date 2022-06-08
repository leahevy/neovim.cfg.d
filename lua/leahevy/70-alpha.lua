local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[ .__                .__                         ]],
    [[ |  |   ____ _____  |  |__   _______  _____.__. ]],
    [[ |  | _/ __ \\__  \ |  |  \_/ __ \  \/ <   |  | ]],
    [[ |  |_\  ___/ / __ \|   Y  \  ___/\   / \___  | ]],
    [[ |____/\___  (____  |___|  /\___  >\_/  / ____| ]],
    [[           \/     \/     \/     \/      \/      ]],
}
if disable_alpha_banners == 1 then
	dashboard.section.header.val = {}
end

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  local handle = io.popen("fortune")
  local fortune = handle:read("*a")
  handle:close()
  return fortune
end

dashboard.section.footer.val = footer()
if disable_alpha_banners == 1 then
	dashboard.section.footer.val = {}
end

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)