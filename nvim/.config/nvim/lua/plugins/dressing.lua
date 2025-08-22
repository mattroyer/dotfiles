return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      border = "rounded",
      title_pos = "center",
      prefer_width = 0.4,
      win_options = { winblend = 0 },
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },
      telescope = require("telescope.themes").get_dropdown({}),
    },
  },
}

