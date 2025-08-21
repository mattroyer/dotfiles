function addkey(mode, keys, func, desc, opts)
  opts = opts or {}

  local map_opts = { desc = desc }

  if opts.remap then
    map_opts.remap = true
  else
    map_opts.noremap = true
  end

  for k,v in pairs(opts) do
    if k ~= "silent" and k ~= "remap" then
      map_opts[k] = v
    end
  end

  vim.keymap.set(mode, keys, func, map_opts)
end

addkey({ 'n', 'v' }, 'k',  "v:count == 0 ? 'gk' : 'k'", 'Remap k to gk for line sanity', { expr = true })
addkey({ 'n', 'v' }, 'j',  "v:count == 0 ? 'gj' : 'j'", 'Remap j to gj for line sanity', { expr = true })

addkey('i', 'kj',          '<ESC>',                         'Press `jk` to invoke Esc')
addkey('n', '<leader>o',   '<Cmd>:update<CR> <Cmd>:source<CR>',       'Reload editor')
addkey('n', '<leader>e',   '<cmd>Oil<CR>',                  'Open Oil with `<leader>e`')
addkey('n', '<leader>+',   '<C-a>',                         'Increment number with `<leader>+`')
addkey('n', '<leader>-',   '<C-x>',                         'Decrement number with `<leader>-`')
addkey('n', '<leader>sv',  '<C-w>v',                        'Split window vertically')
addkey('n', '<leader>sh',  '<C-w>s',                        'Split window horizontally')
addkey('n', '<leader>se',  '<C-w>=',                        'Make split windows equal width')
addkey('n', '<leader>sx',  ':close<CR>',                    'Close current split window')
addkey('n', '<leader>to',  ':tabnew<CR>',                   'Open new tab')
addkey('n', '<leader>tx',  ':tabclose<CR>',                 'Close current tab')
addkey('n', '<leader>x',   ':q<CR>',                        'Close the current buffer')
addkey('n', '<leader>rm',  '!rm %<CR> :bw<CR>',             'Delete the current file')
addkey('n', '<C-/>',       'gcc',                           'Toggle comment',          { remap = true })
addkey('v', '<C-/>',       'gc',                            'Toggle comment (visual)', { remap = true })

addkey("n", "<leader>zn",  ":ZkNew<CR>", "ZK: Create a new note.")
addkey("n", "<leader>zo",  "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "ZK: Open notes.")
addkey("n", "<leader>zt",  "<Cmd>ZkTags<CR>", "ZK: Open notes associated with the selected tags.")
addkey("n", "<leader>zf",  "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "ZK: Search for the notes matching a given query.")
addkey("v", "<leader>zf",  ":'<,'>ZkMatch<CR>", "ZK: Search for the notes matching the current visual selection.")

