-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle filesystem left<CR>', { desc = 'Toggle file [E]xplorer', silent = true })

-- Compare digit runs by value (2 before 100), and other text lexically.
-- Compare digit strings directly to avoid losing precision on large indices.
local function natural_less(left, right)
  local left_name, right_name = left.name or left.path, right.name or right.path
  local a = left_name:gsub('%d+', function(n)
    local digits = n:gsub('^0+', '')
    return ('\001%010d%s'):format(#digits, digits)
  end)
  local b = right_name:gsub('%d+', function(n)
    local digits = n:gsub('^0+', '')
    return ('\001%010d%s'):format(#digits, digits)
  end)
  if a == b then return left_name < right_name end
  return a < b
end

require('neo-tree').setup {
  sort_function = function(a, b)
    if a.type ~= b.type then return a.type < b.type end
    return natural_less(a, b)
  end,
  window = { position = 'left', width = 32 },
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
