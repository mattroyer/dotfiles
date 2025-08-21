return {
  ----------------------------------------------------------------
  -- 1) Mason core (v2)
  ----------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    version = "^2",
    build   = ":MasonUpdate",
    config  = true,  -- runs require("mason").setup()
  },

  ----------------------------------------------------------------
  -- 2) Bridge Mason ↔ LSPConfig (v2)
  ----------------------------------------------------------------
  {
    "mason-org/mason-lspconfig.nvim",
    version      = "^2",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls", "pyright", "ruby_lsp", "gopls",
        "clangd", "html", "cssls", "jsonls",
        "emmet_language_server", "harper_ls",
        "zk"
      },
      automatic_enable = true,
    },
  },

  ----------------------------------------------------------------
  -- 3) Completion stack (load immediately)
  ----------------------------------------------------------------
  {
    "hrsh7th/cmp-nvim-lsp",  -- must come before nvim-cmp so require() works
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("cmp").setup({})  -- simple defaults
    end,
  },

  ----------------------------------------------------------------
  -- 4) nvim-lspconfig (v0.2+)
  ----------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    version = "^0.2",
    config = function()
      -- try to load cmp_nvim_lsp; fallback if not present
      local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = ok
        and cmp_nvim_lsp.default_capabilities()
        or vim.lsp.protocol.make_client_capabilities()

      -- global defaults
      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          local nmap = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "LSP: "..desc })
          end
          nmap("gd", vim.lsp.buf.definition, "Goto Definition")
          nmap("K",  vim.lsp.buf.hover,      "Hover Doc")
        end,
      })

      -- per-server override
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })

      vim.lsp.config("harper_ls", {
        filetypes = { "markdown", "text", "typst" },
        settings = {
          ["harper-ls"] = {
            -- optional tweaks
            linters = {
              SentenceCapitalization = false,
              SpellCheck = true,
            },
          },
        },
      })
    end,
  },
}

