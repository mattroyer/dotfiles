-- nvim-cmp core + common sources
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
      }),
      sources = {
        { name = "path" },
        { name = "buffer" },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- Add Obsidian completion specifically for Markdown
    cmp.setup.filetype({ "markdown", "quarto" }, {
      sources = {
        { name = "obsidian" },  -- 👈 from obsidian.nvim
        { name = "path" },
        { name = "buffer" },
      },
    })
  end,
}

