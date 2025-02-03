return { 
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-qtree/nvim-web-devicons' },
  },

  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      {'nvim-lua/plenary.nvim'},
    }
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
  'stevearc/dressing.nvim',
  opts = {},
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 , config = true,
    opts = {
        contrast = ""
    },
  },

  {
    'samharju/yeet.nvim',
    dependencies = {
        "stevearc/dressing.nvim" -- optional, provides sane UX
    },
    cmd = 'Yeet',
    opts = {},
    keys = {
        {
            -- Open target selection
            "<leader>yt", function() require("yeet").select_target() end,
        },
        {
            -- Update yeeted command
            "<leader>yc", function() require("yeet").set_cmd() end,
        },
        {
            -- Douple tap \ to yeet at something
            "\\\\", function() require("yeet").execute(nil, { clear_before_yeet = false, interrupt_before_yeet=true }) end,
        },
        {
            -- Toggle autocommand for yeeting after write.
            "<leader>yo", function() require("yeet").toggle_post_write() end,
        },
        {
            -- Run command without clearing terminal
            "<leader>\\", function()
                require("yeet").execute(nil, { clear_before_yeet = false})
            end,
        }
    }
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        view_options = {
            show_hidden = false,
            is_hidden_file = function(name, bufnr)
                local m = name:match("^%.")
                return m ~= nil
            end,
        }
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    'tpope/vim-fugitive',
    event = 'BufWinEnter',
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", 
    config = function()
      require("luasnip.loaders.from_snipmate").load({ path = { "~/.dotfiles/nvim/snippets/" } })
    end
  },
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      require("lazy-lsp").setup {
        excluded_servers = {
            "ccls",                            -- prefer clangd
            "denols",                          -- prefer eslint and ts_ls
            "docker_compose_language_service", -- yamlls should be enough?
            "flow",                            -- prefer eslint and ts_ls
            "ltex",                            -- grammar tool using too much CPU
            "quick_lint_js",                   -- prefer eslint and ts_ls
            "scry",                            -- archived on Jun 1, 2023
            "tailwindcss",                     -- associates with too many filetypes
            "biome",                           -- not mature enough to be default
          },
          preferred_servers = {
            markdown = {},
            python = { "basedpyright", "ruff" },
          },
          default_config = {
            flags = {
              debounce_text_changes = 150,
            },
            capabilities = cmp_nvim_lsp.default_capabilities(),
            on_attach = function(_, bufnr)
              local opts = { buffer = _.buf, silent = true }
              opts.buffer = bufnr

              -- set keybinds
              opts.desc = "Show LSP references"
              vim.keymap.set("n", "<leader>r", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

              opts.desc = "Go to declaration"
              vim.keymap.set("n", "<leader>c", vim.lsp.buf.declaration, opts) -- go to declaration

              opts.desc = "Show LSP definitions"
              vim.keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

              opts.desc = "Show LSP implementations"
              vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

              opts.desc = "Show LSP tags in buffer"
              vim.keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show lsp doc symbols

              opts.desc = "Show buffer diagnostics"
              vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

              opts.desc = "Show line diagnostics"
              vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

              opts.desc = "Go to previous diagnostic"
              vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

              opts.desc = "Go to next diagnostic"
              vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

              opts.desc = "Show documentation for what is under cursor"
              vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

              opts.desc = "Restart LSP"
              vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end
          },
      }
    end
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
  
      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()
  
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<Tab>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
          ["<C-b>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-f>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "copilot" },
          { name = "luasnip" }, -- snippets
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        }),
        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        mydiags = {
          mode = "diagnostics", -- inherit from diagnostics mode
          filter = {
            any = {
              buf = 0, -- current buffer
              {
                severity = vim.diagnostic.severity.WARNING, -- errors only
                -- limit to files in the current project
                function(item)
                  return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
                end,
              },
            },
          },
        }
      }
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>lx",
        "<cmd>Trouble mydiags toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>q",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  --{
  --  "sbdchd/neoformat",
  --  config = function()

  --    vim.cmd([[
  --      augroup fmt
  --        autocmd!
  --        autocmd BufWritePre *.py,*.swift undojoin | Neoformat
  --      augroup END
  --    ]])
  --  end
  --},
  {
    "norcalli/nvim-colorizer.lua",
    init = function()
      require('colorizer').setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "python", "tsx", "dart" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
        -- this is an example, not a default. Please see the readme for more configuration options
        vim.g.molten_output_win_max_height = 12

        vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>",
    { silent = true, desc = "Initialize the plugin" })
--vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>",
--    { silent = true, desc = "run operator selection" })
--vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>",
--    { silent = true, desc = "evaluate line" })
--vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>",
--    { silent = true, desc = "re-evaluate cell" })
--vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
--    { silent = true, desc = "evaluate visual selection" })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>hd", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader>ha", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<leader>w", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>e", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>r", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>t", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end  
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    init = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false
          }
        }
      })
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function () require("copilot_cmp").setup() end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end,
    },
  },
  {
    "egradman/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      use_advanced_uri = true,
      app_path = "/Applications/Nix Apps/Obsidian.app",
      open_app_foreground = true,
      workspaces = {
        {
          name = "egradman",
          path = "~/Documents/egradman",
        },
        {
          name = "red6",
          path = "~/Documents/red6",
        },
      },
      mappings = {
        ["<cr>"] = {
            action = function()
                return require("obsidian").util.smart_action()
            end,
            opts = { buffer = true, expr = true },
        },
        

      },
      ui = {
        checkboxes = {
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
      },
    },
    keys = {
        {
            "<leader>oo",
            "<cmd>ObsidianQuickSwitch<cr>",
            desc="obsidian quick switch"
        },
        {
            "<leader>ov",
            "<cmd>ObsidianWorkspace<cr>",
            desc="obsidian select vault"
        },
        {
            "<leader>og",
            "<cmd>ObsidianSearch<cr>",
            desc="obsidian grep"
        },
        {
            "<leader>on",
            "<cmd>ObsidianNew<cr>",
            desc="obsidian new file"
        },
        {
            "<leader>or",
            "<cmd>ObsidianRename<cr>",
            desc="obsidian rename"
        },
        {
            "<leader>oa",
            "<cmd>ObsidianOpen<cr>",
            desc="obsidian open app"
        },
        {
            "<leader>od",
            "<cmd>ObsidianWorkspace red6<cr><cmd>ObsidianDailies<cr>",
            desc="obsidian today"
        },
        {
            "<C-S-l>",
            function() require("obsidian.util").toggle_checkbox() end,
            mode="i",
            desc="obsidian checkbox"
        },
    }
  }
}
