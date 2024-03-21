BANNERS_DIRECTORY = vim.fn.stdpath("config") .. "/lua/plugins/banners/"

local function read_banner_from_file(filename)
  local lines = {}
  for line in io.lines(BANNERS_DIRECTORY .. filename) do
    table.insert(lines, line)
  end
  return lines
end

local function extract_filename(path)
  return path:match("^.+/(.+)$")
end

local function random_banner()
  -- Seed the random number generator
  -- This is necessary because math.random() wasn't working correctly
  math.randomseed(os.time())

  -- Let's grab all the files in the banners directory
  local banner_paths = vim.fn.glob(BANNERS_DIRECTORY .. "*.txt", false, true)
  local banners = {}
  for _, path in ipairs(banner_paths) do
    table.insert(banners, extract_filename(path))
  end

  -- Select a random one
  local banner = banners[math.random(#banners)]
  return read_banner_from_file(banner)
end

return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.header = random_banner()
    end,
  },
}
