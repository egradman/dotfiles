-- vim: set tabstop=2 shiftwidth=2 :
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
            "<leader>yy", function() require("yeet").execute(nil, { clear_before_yeet = false, interrupt_before_yeet=true }) end,
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
    'Wansmer/treesj',
    keys = {
      {
        "g,",
        function() require('treesj').toggle() end,
        desc = "toggle list split",
      },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup({
      })
    end,
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
    init = function()
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

              opts.desc = "Show LSP definitions"
              vim.keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

              opts.desc = "Show LSP implementations"
              vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

              opts.desc = "Show LSP tags in buffer"
              vim.keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show lsp doc symbols


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
          --{ name = "copilot" },
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
  -- {
  --   "folke/trouble.nvim",
  --   opts = {
  --     modes = {
  --       mydiags = {
  --         mode = "diagnostics", -- inherit from diagnostics mode
  --         filter = {
  --           any = {
  --             buf = 0, -- current buffer
  --             {
  --               severity = vim.diagnostic.severity.WARNING, -- errors only
  --               -- limit to files in the current project
  --               function(item)
  --                 return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
  --               end,
  --             },
  --           },
  --         },
  --       }
  --     }
  --   }, -- for default options, refer to the configuration section for custom setup.
  --   cmd = "Trouble",
  --   keys = {
  --     {
  --       "<leader>lx",
  --       "<cmd>Trouble mydiags toggle<cr>",
  --       desc = "Diagnostics (Trouble)",
  --     },
  --     {
  --       "<leader>xX",
  --       "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  --       desc = "Buffer Diagnostics (Trouble)",
  --     },
  --     {
  --       "<leader>cs",
  --       "<cmd>Trouble symbols toggle focus=false<cr>",
  --       desc = "Symbols (Trouble)",
  --     },
  --     {
  --       "<leader>cl",
  --       "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  --       desc = "LSP Definitions / references / ... (Trouble)",
  --     },
  --     {
  --       "<leader>xL",
  --       "<cmd>Trouble loclist toggle<cr>",
  --       desc = "Location List (Trouble)",
  --     },
  --     {
  --       "<leader>q",
  --       "<cmd>Trouble qflist toggle<cr>",
  --       desc = "Quickfix List (Trouble)",
  --     },
  --   },
  -- },
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
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "python", "tsx", "dart", "yaml" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {"<leader>ta", function() require("harpoon"):list():add() end, desc="harpoon  add"},
      {"<leader>tl", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc="harpoon list"},

      {"<leader>tq", function() require("harpoon"):list():select(1) end, desc="buffer 1"},
      {"<leader>tw", function() require("harpoon"):list():select(2) end, desc="buffer 2"},
      {"<leader>te", function() require("harpoon"):list():select(3) end, desc="buffer 3"},
      {"<leader>tr", function() require("harpoon"):list():select(4) end, desc="buffer 4"},

      {"<C-S-P>", function() require("harpoon"):list():prev() end, desc="previous"},
      {"<C-S-N>", function() require("harpoon"):list():next() end, desc="next"},
    }

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
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
      },
      opts = {
      },
    },
    keys = {
        {
            "<leader>al",
            "<cmd>CodeCompanionActions<cr>",
            desc="code companion actions",
            mode={"n", "v"}
        },
        {
            "<leader>ac",
            "<cmd>CodeCompanionChat<cr>",
            desc="code companion chat"
        },
        {
            "<leader>ay",
            "<cmd>CodeCompanionChat Add<cr>",
            desc="code companion add",
            mode="v"
        },
        {
            "<leader>ai",
            ":CodeCompanion /buffer ",
            desc="code companion inline",
            mode={"v", "n"}
        },
    }
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    keys = {
        {
            "<leader>as", function() require("copilot.suggestion").toggle_auto_trigger() end, desc="toggle auto suggestion"
        },
    }
  },
  --{
  --  "zbirenbaum/copilot-cmp",
  --  event = "InsertEnter",
  --  config = function () require("copilot_cmp").setup() end,
  --  dependencies = {
  --    "zbirenbaum/copilot.lua",
  --    cmd = "Copilot",
  --    config = function()
  --      require("copilot").setup({
  --        suggestion = { enabled = false },
  --        panel = { enabled = false },
  --      })
  --    end,
  --  },
  --},
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
      disable_frontmatter = true,
        bullets = { char = "• ", hl_group = "ObsidianBullet" },
      note_path_func = function(spec)
        local path = spec.dir / tostring(spec.title)
        return path:with_suffix(".md")
      end,
      templates = {
        folder = "/Users/egradman/Documents/egradman/templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      workspaces = {
        {
          name = "egradman",
          path = "~/Documents/egradman",
        },
        {
          name = "red6",
          path = "~/Documents/red6",
        },
        {
          name = "no-vault",
          path = function()
            -- alternatively use the CWD:
            -- return assert(vim.fn.getcwd())
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
          overrides = {
            notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
            new_notes_location = "current_dir",
            disable_frontmatter = true,
          },
        },
      },
      mappings = {
        ["<CS-l>"] = {
            action = function()
                return require("obsidian").util.smart_action()
            end,
            opts = { buffer = true, expr = true },
        },
        

      },
      ui = {
        checkboxes = {
            [" "] = { char = "󰄱 ", hl_group = "ObsidianTodo" },
            ["x"] = { char = " ", hl_group = "ObsidianDone" },
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
            "<leader>ot",
            "<cmd>ObsidianTemplate<cr>",
            desc="obsidian template"
        },
        {
            "<C-S-l>",
            function() require("obsidian.util").toggle_checkbox() end,
            mode="i",
            desc="obsidian checkbox"
        },
    }
  },
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  }, 
  {
    "3rd/image.nvim",
    opts = {
      processor = "magick_cli", -- or "magick_cli"
        backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
        integrations = {}, -- do whatever you want with image.nvim's integrations
        max_width = 100, -- tweak to preference
        max_height = 12, -- ^
        max_height_window_percentage = math.huge, -- this is necessary for a good experience
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    }
  },
  {
      "benlubas/molten-nvim",
      version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
      dependencies = { "3rd/image.nvim" },
      build = ":UpdateRemotePlugins",
      init = function()
          -- these are examples, not defaults. Please see the readme
          vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_output_win_max_height = 20
          vim.g.molten_auto_open_output = false
          vim.g.molten_wrap_output = true
          vim.g.molten_virt_text_output = true
          vim.g.molten_virt_lines_off_by_1 = true
          vim.g.molten_cover_empty_lines = true
          vim.g.molten_cover_lines_starting_with = {"# %%"}
      end,
  },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      { "<leader>r<Up>", function() require("notebook-navigator").move_cell "u" end },
      { "<leader>r<Down>", function() require("notebook-navigator").move_cell "d" end },
      { "<leader>rr", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>rt", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
      { "<leader>rs", "<cmd>lua require('notebook-navigator').split_cell()<cr>" },
    },
    dependencies = {
      "echasnovski/mini.comment",
      "benlubas/molten-nvim",
      "anuvyklack/hydra.nvim",
    },
    opts = {
      syntax_highlight = true
    },
    event = "VeryLazy",
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
    },
    ft = { 'markdown', 'quarto' },

  },
  { 'echasnovski/mini.comment', version = "*" },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require "notebook-navigator"

      local opts = { custom_textobjects = { h = nn.miniai_spec } }
      return opts
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require "notebook-navigator"

      local opts = { highlighters = { cells = nn.minihipatterns_spec } }
      return opts
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {'kevinhwang91/promise-async'},
    keys = {
       { "z<Right>", "zo" },
       { "z<Left>", "zc" },
       { "z<Down>", function() require('ufo').openAllFolds() end },
       { "z<Up>", function() require('ufo').closeAllFolds() end },

       { "zp", function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
            -- choose one of coc.nvim and nvim lsp
            vim.fn.CocActionAsync('definitionHover') -- coc.nvim
            vim.lsp.buf.hover()
        end
      end }
    },
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
      }
      local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
          require('lspconfig')[ls].setup({
              capabilities = capabilities
              -- you can add other fields for setting up lsp server in this table
          })
      end
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
            else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, {chunkText, hlGroup})
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                end
                break
            end
            curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, 'MoreMsg'})
        return newVirtText
      end
      require('ufo').setup({
          fold_virt_text_handler = handler
      })
    end

  }
}
