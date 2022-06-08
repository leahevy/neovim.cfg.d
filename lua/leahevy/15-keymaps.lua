keymap_opts = { noremap = true, silent = true }

term_opts = { silent = true }

-- Shorten function name
keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", keymap_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", keymap_opts)
keymap("n", "<C-j>", "<C-w>j", keymap_opts)
keymap("n", "<C-k>", "<C-w>k", keymap_opts)
keymap("n", "<C-l>", "<C-w>l", keymap_opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", keymap_opts)
keymap("n", "<C-Down>", ":resize +2<CR>", keymap_opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", keymap_opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", keymap_opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", keymap_opts)
keymap("n", "<S-h>", ":bprevious<CR>", keymap_opts)
keymap("n", "gt", ":bnext<CR>", keymap_opts)
keymap("n", "gT", ":bprevious<CR>", keymap_opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", keymap_opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", keymap_opts)

-- Fix movements for wrapped lines
keymap("n", "j", "gj", keymap_opts)
keymap("n", "k", "gk", keymap_opts)
keymap("n", "0", "g0", keymap_opts)
keymap("n", "$", "g$", keymap_opts)
keymap("x", "j", "gj", keymap_opts)
keymap("x", "k", "gk", keymap_opts)
keymap("x", "0", "g0", keymap_opts)
keymap("x", "$", "g$", keymap_opts)

-- Semicolon
if keyboard_layout_uk == 1 then
	vim.cmd [[
	    noremap ; :
	    noremap : ;
	]]
end

-- Replace
vim.cmd [[nnoremap S :%s///g<left><left><left>]]
vim.cmd [[nnoremap <leader>r yiw:%s/\<<C-r>"\>//g<left><left>]]

-- Paste in insert mode
keymap("i", "<c-v>", "<ESC>pa", keymap_opts)

-- Key Y as yy
keymap("n", "Y", "yy", keymap_opts)

-- Key c-p as paste new line
keymap("n", "<c-p>", "o<ESC>pk\"_dd", keymap_opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", keymap_opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", keymap_opts)
keymap("v", ">", ">gv", keymap_opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", keymap_opts)
keymap("v", "<A-k>", ":m .-2<CR>==", keymap_opts)
keymap("v", "p", '"_dP', keymap_opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", keymap_opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", keymap_opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", keymap_opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", keymap_opts)


-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
