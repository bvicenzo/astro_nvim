return {
  {
    "cajames/copy-reference.nvim",
    opts = {
      register = "+",        -- Clipboard register (+ for system clipboard)
      use_git_root = true,   -- Use git root for relative paths when in a git repo
    }, -- optional configuration
    keys = {
      { "yr", "<cmd>CopyReference file<cr>", mode = { "n", "v" }, desc = "Copy file path" },
      { "yrr", "<cmd>CopyReference line<cr>", mode = { "n", "v" }, desc = "Copy file:line reference" },
    },
  }
}
