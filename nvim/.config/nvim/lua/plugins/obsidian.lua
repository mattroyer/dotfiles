return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = { "markdown" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      workspaces = {
        { name = "notes", path = "~/notes" },
      },
      legacy_commands = false,
      daily_notes = { folder = "daily" },
      completion = { nvim_cmp = true }, -- keep it light; turn on later if you want
      ui = { enable = false },           -- disable fancy UI to minimize overhead
    },
  },
}
 
