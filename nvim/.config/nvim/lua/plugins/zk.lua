return {
  "mickael-menu/zk-nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    -- dressing gives the nice floating prompts for vim.ui.input/select
    "stevearc/dressing.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("zk").setup({
      picker = "telescope",
      lsp = {
        config = { cmd = { "zk", "lsp" }, name = "zk" },
        auto_attach = { enabled = true, filetypes = { "markdown" } },
      },
    })

    local km  = require("utils.map")
    local zkc = require("zk.commands")

    -- small helper to prompt in a float and ignore cancel/empty
    local function float_input(opts, on_ok)
      vim.ui.input(opts, function(val)
        if not val or val == "" then return end
        on_ok(val)
      end)
    end

    km.n("<leader>nf", km.cmd("ZkNotes"), 'ZK: Find notes')

    km.n("<leader>nP", function() zkc.get("ZkNotes")({ dir = "projects" }) end, 'ZK: Notes in projects/')
    km.n("<leader>nT", function() zkc.get("ZkNotes")({ dir = "topics" }) end, 'ZK: Notes in topics/')
    km.n("<leader>nD", function() zkc.get("ZkNotes")({ dir = "daily" }) end, 'ZK: Notes in daily/')

    km.n("leader>nF", function() zkc.get("ZkGrep")({}) end, 'ZK: Grep notes')

    km.n("<leader>nl", km.cmd("ZkInsertLink"), "ZK: Insert link")
    km.v("<leader>nl", ":'<,'>ZkInsertLinkAtSelection { matchSelected = true }<CR>", "ZK: Link selection")

    -- New note (title)
    km.n("<leader>nn", function()
      float_input({ prompt = "Title: " }, function(title)
        zkc.get("ZkNew")({ title = title })
      end)
    end, "ZK: New note")

    -- Choose folder first → then title prompt (daily/people/projects/topics/root)
    km.n("<leader>nN", function()
      local choices = { "daily", "people", "projects", "topics", "root" }
      vim.ui.select(choices, { prompt = "New note → location:" }, function(dir)
        if not dir then return end
        if dir == "daily" then
          zkc.get("ZkNew")({ dir = "daily", title = os.date("%Y-%m-%d") })
          return
        end
        float_input({ prompt = "Title (optional #tags inline): " }, function(title)
          zkc.get("ZkNew")({
            dir = (dir == "root") and "" or dir,
            title = title,
          })
        end)
      end)
    end, "ZK: New note (choose dir)")

    -- Daily note YYYY-MM-DD under daily/
    km.n("<leader>nd", function()
      zkc.get("ZkNew")({ dir = "daily", title = os.date("%Y-%m-%d") })
    end, "ZK: New daily")

    -- Search notes (title/content)
    km.n("<leader>ns", function()
      float_input({ prompt = "Search notes: " }, function(q)
        zkc.get("ZkNotes")({ match = q, sort = { "modified" } })
      end)
    end, "ZK: Search notes")

    -- Grep inside all notes
    km.n("<leader>ng", function()
      float_input({ prompt = "Grep phrase: " }, function(q)
        zkc.get("ZkGrep")({ search = q })
      end)
    end, "ZK: Grep content")


    -- Backlinks / Tags / Link to another note
    km.n("<leader>nt", function() zkc.get("ZkTags")({})      end, "ZK: Tags")

    km.n("<leader>nL", km.cmd("ZkLinks"), "ZK: Show outbound links to this note")
    km.n("<leader>nb", km.cmd("ZkBacklinks"), "ZK: Backlinks to this note")

    -- Visual: new note from selection (title/content) + link back
    km.v("<leader>nN", function() zkc.get("ZkNewFromTitleSelection")({}) end,
      "ZK: New from title selection")
    km.v("<leader>nC", function() zkc.get("ZkNewFromContentSelection")({}) end,
      "ZK: New from content selection")

    -- Optional: auto-frontmatter for brand-new Markdown files
    -- vim.api.nvim_create_autocmd("BufNewFile", {
    --   pattern = "*.md",
    --   group = vim.api.nvim_create_augroup("ZKFrontmatter", { clear = true }),
    --   callback = function()
    --     if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
    --       local lines = {
    --         "---",
    --         "title: " .. vim.fn.expand("%:t:r"),
    --         "date: " .. os.date("%Y-%m-%d"),
    --         "tags: []",
    --         "---",
    --         "",
    --       }
    --       vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    --       vim.api.nvim_win_set_cursor(0, { #lines, 0 })
    --     end
    --   end,
    -- })
  end,
}

