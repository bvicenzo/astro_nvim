-- Flutter Tools Configuration
return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup {
        -- Flutter SDK path (mise provides it)
        flutter_path = nil, -- Auto-detect from PATH

        -- Use Neovim LSP
        lsp = {
          color = {
            enabled = true, -- Show color previews
            background = true,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          on_attach = function(_client, bufnr)
            -- Custom keymaps (usando <leader>F para evitar conflito com <leader>fr)
            vim.keymap.set("n", "<leader>Fl", "<cmd>FlutterReload<cr>", { buffer = bufnr, noremap = true, silent = true, desc = "Hot Reload" })
            vim.keymap.set("n", "<leader>FR", "<cmd>FlutterRestart<cr>", { buffer = bufnr, noremap = true, silent = true, desc = "Hot Restart" })
            vim.keymap.set("n", "<leader>Fq", "<cmd>FlutterQuit<cr>", { buffer = bufnr, noremap = true, silent = true, desc = "Quit Flutter" })
            vim.keymap.set("n", "<leader>Fd", "<cmd>FlutterDevices<cr>", { buffer = bufnr, noremap = true, silent = true, desc = "Select Device" })
            vim.keymap.set("n", "<leader>Fe", "<cmd>FlutterEmulators<cr>", { buffer = bufnr, noremap = true, silent = true, desc = "Launch Emulator" })
            vim.keymap.set("n", "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", { buffer = bufnr, noremap = true, silent = true, desc = "Toggle Outline" })
          end,
          capabilities = function(config)
            config.textDocument.codeAction = {
              dynamicRegistration = false,
              codeActionLiteralSupport = {
                codeActionKind = {
                  valueSet = {
                    "",
                    "quickfix",
                    "refactor",
                    "refactor.extract",
                    "refactor.inline",
                    "refactor.rewrite",
                    "source",
                    "source.organizeImports",
                  },
                },
              },
            }
            return config
          end,
        },

        -- Flutter outline
        widget_guides = {
          enabled = true,
        },

        -- Dev tools
        dev_tools = {
          autostart = false,
          auto_open_browser = false,
        },

        -- Decorations
        decorations = {
          statusline = {
            device = true,
            app_version = false,
          },
        },
      }
    end,
  },
}
