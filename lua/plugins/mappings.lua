return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<Leader>jt"] = { "<esc>:%!ruby -rjson -e \"print JSON.pretty_generate(JSON.parse(ARGF.read))\"<esc>=%<cr>", desc = "Intent JSON file" },
          ["<Leader>bd"] = { "<esc>:bw<cr>", desc = "Closes current buffer" },
          ["<Leader>,"] = { "<esc>:e#<cr>", desc = "Goes to last opened buffer" },
          ["<Leader>nt"] = { "<esc>:Neotree toggle reveal<cr>", desc = "Goes to last opened buffer" },
          ["<Leader>cs"] = { "<esc>:nohlsearch<cr>", desc = "Clear search highlight" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
