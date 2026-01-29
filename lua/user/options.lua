-- Options
vim.opt.colorcolumn = "100,120"

-- Keymaps

-- Normal Only
vim.keymap.set("n", "<leader>pp", "<leader>ff", { remap = true })
vim.keymap.set("n", "<leader>be", "<leader>fb", { remap = true })

-- Visual Only
vim.keymap.set("v", "<leader>rs", [[:s/\v(['"])([a-zA-Z0-9_]+)\1/:\2/g<CR>]], { desc = "Ruby: strings -> symbols (selection)" })
