return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<Leader>pp"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find Files" },
          ["<Leader>be"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Buffer explorer" },
          ["<Leader>jt"] = { "<esc>:%!ruby -rjson -e \"print JSON.pretty_generate(JSON.parse(ARGF.read))\"<esc>=%<cr>", desc = "Intent JSON file" },
          ["<Leader>bd"] = { "<esc>:bw<cr>", desc = "Closes current buffer" },
          ["<Leader>,"] = { "<esc>:e#<cr>", desc = "Goes to last opened buffer" },
          ["<Leader>nt"] = { "<esc>:Neotree toggle<cr>", desc = "Goes to last opened buffer" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
