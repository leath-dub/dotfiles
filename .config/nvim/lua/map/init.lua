local map = vim.api.nvim_set_keymap

-- Open terminal bindings
map("n", "<c-k>", ":lcd %:p:h<cr>:vsplit term://zsh<cr>i", { noremap = true, silent = true })
map("t", "<c-k>", "<c-\\><c-n><c-w>q", { noremap = false, silent = true})
map("t", "<esc>", "<c-\\><c-n>", { noremap = false, silent = true })

-- Saving and quiting
map("n", "<c-s>", ":w<cr>", { noremap = false, silent = true})

-- Match keybindings
map("i", "<c-d>\"", "\"\"<esc>i", {noremap = true})
map("i", "<c-d>\'", "\'\'<esc>i", {noremap = true})
map("i", "<c-d>(", "()<esc>i", {noremap = true})
map("i", "<c-d>[", "[]<esc>i", {noremap = true})
map("i", "<c-d>{", "{}<esc>i", {noremap = true})
